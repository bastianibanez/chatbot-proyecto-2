// Mostramos texto, sin insertar HTML que venga de una pregunta o respuesta.
const form = document.querySelector('#formulario');
const input = document.querySelector('#pregunta');
const mensajes = document.querySelector('#mensajes');
const estado = document.querySelector('#estado');
const enviar = document.querySelector('#enviar');
let ocupado = false;
function agregar(texto, tipo) {
  const mensaje = document.createElement('article');
  mensaje.className = `mensaje ${tipo}`;
  mensaje.textContent = texto;
  mensajes.appendChild(mensaje);
  mensajes.scrollTop = mensajes.scrollHeight;
}
async function preguntar(pregunta) {
  if (ocupado || !pregunta.trim()) return;
  ocupado = true; enviar.disabled = true;
  agregar(pregunta, 'usuario'); input.value = '';
  estado.textContent = 'Consultando…';
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(), 15000);
  try {
    const response = await fetch('/api/chat', {
      method: 'POST', headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({pregunta}), signal: controller.signal
    });
    if (!response.ok) throw new Error('No se pudo consultar el servidor.');
    const data = await response.json();
    agregar(data.respuesta, 'bot');
    estado.textContent = '';
  } catch (error) {
    agregar('No pude conectarme al servidor. Comprueba que SWI-Prolog está ejecutándose y abre http://localhost:8000.', 'bot');
    estado.textContent = 'Error de conexión. Puedes volver a intentarlo.';
  } finally {
    clearTimeout(timeout); ocupado = false; enviar.disabled = false; input.focus();
  }
}
form.addEventListener('submit', event => {event.preventDefault(); preguntar(input.value.trim());});
document.querySelectorAll('#ejemplos button').forEach(button => button.addEventListener('click', () => preguntar(button.textContent)));
document.querySelector('#limpiar').addEventListener('click', () => {
  if (ocupado) return;
  mensajes.replaceChildren();
  input.focus();
  estado.textContent = 'Conversación limpiada.';
});
