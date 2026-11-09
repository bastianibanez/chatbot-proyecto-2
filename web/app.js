const form = document.querySelector('#formulario');
const input = document.querySelector('#pregunta');
const mensajes = document.querySelector('#mensajes');
const estado = document.querySelector('#estado');
const selector = document.querySelector('#modo');
const limpiar = document.querySelector('#limpiar');
const botones = document.querySelectorAll('button');
const chats = {prolog: [], llm: []};
let sesion = null;
let ocupado = false;

function bloquear(valor) {
  ocupado = valor;
  botones.forEach(button => { button.disabled = valor; });
  selector.disabled = valor;
  input.disabled = valor;
}

function nodo(tag, texto, clase) {
  const element = document.createElement(tag);
  if (texto !== undefined) element.textContent = texto;
  if (clase) element.className = clase;
  return element;
}

function valorLegible(valor) {
  if (valor === null || valor === undefined) return nodo('span', '—');
  if (Array.isArray(valor)) {
    if (!valor.length) return nodo('span', 'Lista vacía');
    if (valor.every(v => v && typeof v === 'object' && !Array.isArray(v) && !v.functor)) {
      const columnas = [...new Set(valor.flatMap(v => Object.keys(v)))];
      if (!columnas.length) return nodo('span', 'Consulta satisfecha.');
      const wrapper = nodo('div', undefined, 'resultados-tabla');
      const tabla = nodo('table');
      const cabecera = nodo('tr');
      columnas.forEach(key => {
        const th = nodo('th', key.replace(/_/g, ' '));
        th.scope = 'col';
        cabecera.append(th);
      });
      const head = nodo('thead');
      head.append(cabecera);
      const body = nodo('tbody');
      valor.forEach(fila => {
        const tr = nodo('tr');
        columnas.forEach(key => {
          const td = nodo('td');
          td.append(valorLegible(fila[key]));
          tr.append(td);
        });
        body.append(tr);
      });
      tabla.append(head, body);
      wrapper.append(tabla);
      return wrapper;
    }
    const lista = nodo('ul');
    valor.forEach(v => { const li = nodo('li'); li.append(valorLegible(v)); lista.append(li); });
    return lista;
  }
  if (typeof valor === 'object') {
    if (valor.functor && Array.isArray(valor.argumentos)) {
      const termino = nodo('span', `${valor.functor}(`, 'termino-prolog');
      valor.argumentos.forEach((arg, i) => {
        if (i) termino.append(', ');
        termino.append(valorLegible(arg));
      });
      termino.append(')');
      return termino;
    }
    const lista = nodo('dl');
    Object.entries(valor).forEach(([key, value]) => {
      const dd = nodo('dd');
      dd.append(valorLegible(value));
      lista.append(nodo('dt', key.replace(/_/g, ' ')), dd);
    });
    return lista;
  }
  return nodo('span', typeof valor === 'boolean' ? (valor ? 'Sí' : 'No') : String(valor));
}

function actualizarTool(call, grupo) {
  if (!call.elemento) {
    call.elemento = nodo('details', undefined, 'tool-call');
    call.resumen = nodo('summary');
    call.titulo = nodo('span', undefined, 'tool-titulo');
    call.estadoElemento = nodo('span', undefined, 'tool-estado');
    call.resumen.append(call.titulo, call.estadoElemento);
    call.cuerpo = nodo('div', undefined, 'tool-detalle');
    call.elemento.append(call.resumen, call.cuerpo);
    grupo.append(call.elemento);
  }
  const resultado = call.resultado;
  const estadoCall = resultado?.estado;
  const etiquetas = {ok: 'Completada', sin_datos: 'Sin datos', consulta_invalida: 'Error', error: 'Error',
    limite: 'Límite alcanzado', interrumpida: 'Interrumpida'};
  call.elemento.dataset.estado = estadoCall || 'ejecutando';
  call.titulo.textContent = call.argumentos?.descripcion || 'Consultar datos de mundiales';
  const duracion = Number.isFinite(call.duracion_ms)
    ? ` · ${(call.duracion_ms / 1000).toLocaleString('es-CL', {minimumFractionDigits: 2, maximumFractionDigits: 2})} s` : '';
  call.estadoElemento.textContent = (etiquetas[estadoCall] || (resultado ? 'Error' : 'Ejecutando…')) + duracion;
  call.cuerpo.replaceChildren();
  call.cuerpo.append(nodo('p', call.herramienta, 'tool-nombre'), nodo('h3', 'Consulta Prolog'));
  const pre = nodo('pre');
  pre.tabIndex = 0;
  pre.setAttribute('aria-label', 'Consulta Prolog');
  pre.append(nodo('code', call.argumentos?.consulta || 'No se recibió una consulta válida.'));
  const resultados = nodo('div', undefined, 'tool-resultados');
  resultados.tabIndex = 0;
  resultados.setAttribute('role', 'region');
  resultados.setAttribute('aria-label', 'Resultados de la consulta');
  call.cuerpo.append(pre, nodo('h3', 'Resultados'), resultados);
  if (!resultado) resultados.append(nodo('p', 'Esperando el resultado…'));
  else if (estadoCall === 'sin_datos') resultados.append(nodo('p', 'No se encontraron coincidencias.'));
  else if (Array.isArray(resultado.resultados) && resultado.resultados.length) {
    resultados.append(valorLegible(resultado.resultados));
    const total = resultado.resultados.length;
    call.cuerpo.append(nodo('p', `${total} ${total === 1 ? 'resultado' : 'resultados'}` +
      (resultado.truncado ? ' · Se alcanzó el límite; hay más resultados.' : ''), 'tool-nota'));
  } else if (resultado.detalle) resultados.append(valorLegible(resultado.detalle));
  else resultados.append(nodo('p', estadoCall === 'ok' ? 'Consulta satisfecha.' : 'La consulta no pudo completarse.'));
}

function actualizarMensaje(item) {
  item.elemento.className = `mensaje ${item.tipo}`;
  item.contenido.className = item.html ? 'markdown' : '';
  if (item.html) {
    // Solo HTML renderizado por la API con MarkdownIt y html:false.
    item.contenido.innerHTML = item.html;
  } else item.contenido.textContent = item.texto || '';
}

function renderizar() {
  mensajes.replaceChildren();
  for (const item of chats[selector.value]) {
    item.elemento = nodo('article');
    item.grupo = nodo('div', undefined, 'tool-calls');
    for (const call of item.traza || []) {
      call.elemento = null;
      actualizarTool(call, item.grupo);
    }
    item.contenido = nodo('div');
    item.elemento.append(item.grupo, item.contenido);
    actualizarMensaje(item);
    mensajes.append(item.elemento);
  }
  mensajes.scrollTop = mensajes.scrollHeight;
}

async function recibirTurno(payload, onEvent) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 95000);
  let reader;
  try {
    const response = await fetch('/api/chat/stream', {
      method: 'POST', headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(payload), signal: controller.signal
    });
    if (!response.ok) {
      const data = await response.json().catch(() => ({}));
      throw new Error(typeof data.detail === 'string' ? data.detail : 'No se pudo iniciar la consulta.');
    }
    reader = response.body.getReader();
    const decoder = new TextDecoder();
    let buffer = '';
    let final;
    function procesar(linea) {
      if (!linea.trim()) return;
      const event = JSON.parse(linea);
      if (event.tipo === 'error') {
        const error = new Error(event.datos.detail);
        error.status = event.datos.status;
        throw error;
      }
      if (event.tipo === 'respuesta') final = event.datos;
      else onEvent(event);
    }
    while (true) {
      const {value, done} = await reader.read();
      buffer += decoder.decode(value, {stream: !done});
      const lineas = buffer.split('\n');
      buffer = lineas.pop();
      lineas.forEach(procesar);
      if (done) break;
    }
    procesar(buffer);
    if (!final) throw new Error('Se interrumpió la conexión. Puedes volver a intentarlo.');
    return final;
  } catch (error) {
    if (error.name === 'AbortError') throw new Error('La consulta tardó demasiado. Puedes volver a intentarlo.');
    if (error instanceof TypeError) throw new Error('Se perdió la conexión con el servidor. Puedes volver a intentarlo.');
    throw error;
  } finally {
    clearTimeout(timeout);
    if (reader) await reader.cancel().catch(() => {});
  }
}

async function solicitar(url, options = {}) {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 95000);
  try {
    const response = await fetch(url, {...options, signal: controller.signal});
    const data = await response.json().catch(() => ({}));
    if (!response.ok) {
      const error = new Error(typeof data.detail === 'string' ? data.detail :
        response.status === 422 ? 'Revisa la pregunta: debe tener entre 1 y 500 caracteres.' :
        'No se pudo completar la solicitud. Puedes volver a intentarlo.');
      error.status = response.status;
      throw error;
    }
    return data;
  } catch (error) {
    if (error.name === 'AbortError') throw new Error('La consulta tardó demasiado. Puedes volver a intentarlo.');
    if (error instanceof TypeError) throw new Error('No se pudo conectar con el servidor. Comprueba que el backend esté ejecutándose.');
    throw error;
  } finally {
    clearTimeout(timeout);
  }
}

async function preguntar(pregunta) {
  pregunta = pregunta.trim();
  if (ocupado || !pregunta) return;
  const modo = selector.value;
  bloquear(true);
  const respuesta = {tipo: 'bot', texto: '', traza: []};
  chats[modo].push({tipo: 'usuario', texto: pregunta}, respuesta);
  renderizar();
  input.value = '';
  estado.textContent = 'Preparando respuesta…';
  try {
    const data = await recibirTurno({modo, pregunta, sesion: modo === 'llm' ? sesion : null}, event => {
      const seguir = mensajes.scrollHeight - mensajes.scrollTop - mensajes.clientHeight < 80;
      const datos = event.datos;
      let call = respuesta.traza.find(c => c.numero === datos.numero);
      if (!call) {
        call = {inicio: performance.now()};
        respuesta.traza.push(call);
      }
      Object.assign(call, datos);
      actualizarTool(call, respuesta.grupo);
      estado.textContent = event.tipo === 'tool_inicio' ? 'Consultando Prolog…' : 'Preparando respuesta…';
      if (seguir) mensajes.scrollTop = mensajes.scrollHeight;
    });
    if (modo === 'llm') sesion = data.sesion;
    respuesta.texto = data.respuesta;
    respuesta.html = data.respuesta_html;
    estado.textContent = '';
  } catch (error) {
    if (error.status === 410) sesion = null;
    respuesta.tipo = 'bot error';
    respuesta.texto = error.message;
    estado.textContent = 'No se completó la consulta.';
    input.value = pregunta;
  } finally {
    for (const call of respuesta.traza) {
      if (!call.resultado) {
        call.resultado = {estado: 'interrumpida', detalle: 'El turno terminó sin recibir el resultado de esta consulta.'};
        call.duracion_ms = performance.now() - call.inicio;
        actualizarTool(call, respuesta.grupo);
      }
      call.elemento.open = false;
    }
    actualizarMensaje(respuesta);
    mensajes.scrollTop = mensajes.scrollHeight;
    bloquear(false);
    input.focus();
  }
}

form.addEventListener('submit', event => {
  event.preventDefault();
  preguntar(input.value);
});
document.querySelectorAll('#ejemplos button').forEach(button =>
  button.addEventListener('click', () => preguntar(button.textContent)));
selector.addEventListener('change', () => {
  renderizar();
  estado.textContent = '';
  input.focus();
});
limpiar.addEventListener('click', async () => {
  if (ocupado) return;
  const modo = selector.value;
  bloquear(true);
  try {
    if (modo === 'llm' && sesion) {
      await solicitar(`/api/sesiones/${encodeURIComponent(sesion)}`, {method: 'DELETE'});
      sesion = null;
    }
    chats[modo] = [];
    renderizar();
    estado.textContent = 'Conversación limpiada.';
  } catch (error) {
    estado.textContent = error.message;
  } finally {
    bloquear(false);
    input.focus();
  }
});
