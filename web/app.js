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
  mensajes.setAttribute('aria-busy', String(valor));
}

function renderizar() {
  mensajes.replaceChildren();
  for (const item of chats[selector.value]) {
    const mensaje = document.createElement('article');
    mensaje.className = `mensaje ${item.tipo}`;
    const contenido = document.createElement('div');
    if (item.html) {
      // Solo HTML renderizado por la API con MarkdownIt y html:false.
      contenido.className = 'markdown';
      contenido.innerHTML = item.html;
    } else {
      contenido.textContent = item.texto;
    }
    mensaje.appendChild(contenido);
    if (item.traza?.length) {
      const detalle = document.createElement('details');
      detalle.className = 'consultas';
      const titulo = document.createElement('summary');
      titulo.textContent = `Consultas a Prolog (${item.traza.length})`;
      detalle.appendChild(titulo);
      item.traza.forEach((call, index) => {
        const nombre = document.createElement('p');
        nombre.textContent = `${index + 1}. ${call.herramienta}`;
        const datos = document.createElement('pre');
        datos.textContent = JSON.stringify({argumentos: call.argumentos, resultado: call.resultado}, null, 2);
        detalle.append(nombre, datos);
      });
      mensaje.appendChild(detalle);
    }
    mensajes.appendChild(mensaje);
  }
  mensajes.scrollTop = mensajes.scrollHeight;
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
  chats[modo].push({tipo: 'usuario', texto: pregunta});
  renderizar();
  input.value = '';
  estado.textContent = 'Consultando…';
  try {
    const data = await solicitar('/api/chat', {
      method: 'POST', headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({modo, pregunta, sesion: modo === 'llm' ? sesion : null})
    });
    if (modo === 'llm') sesion = data.sesion;
    chats[modo].push({tipo: 'bot', texto: data.respuesta, html: data.respuesta_html, traza: data.traza});
    estado.textContent = '';
  } catch (error) {
    if (error.status === 410) sesion = null;
    chats[modo].push({tipo: 'bot error', texto: error.message});
    estado.textContent = 'No se completó la consulta.';
    input.value = pregunta;
  } finally {
    renderizar();
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
