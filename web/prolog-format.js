/* Presentación de consultas: solo modifica espacios fuera de literales y comentarios. */
const PrologFormato = (() => {
  function tokens(source) {
    const result = [];
    for (let i = 0; i < source.length;) {
      const start = i;
      let tipo = '';
      if (/\s/.test(source[i])) {
        while (i < source.length && /\s/.test(source[i])) i++;
        tipo = 'espacio';
      } else if (source[i] === '%') {
        while (i < source.length && source[i] !== '\n') i++;
        tipo = 'comentario';
      } else if (source.startsWith('/*', i)) {
        let depth = 1;
        i += 2;
        while (i < source.length && depth) {
          if (source.startsWith('/*', i)) { depth++; i += 2; }
          else if (source.startsWith('*/', i)) { depth--; i += 2; }
          else i++;
        }
        if (depth) return null;
        tipo = 'comentario';
      } else {
        const number = source.slice(i).match(/^(?:0'(?:\\(?:[a-zA-Z]|.)|[^\\])|\d+'[\da-zA-Z]+|0[xob][\da-fA-F]+|\d+(?:\.\d+)?(?:[eE][+-]?\d+)?)/);
        if (number) {
          i += number[0].length;
          tipo = 'numero';
        } else if ('"\'`'.includes(source[i])) {
          const quote = source[i++];
          let closed = false;
          while (i < source.length) {
            if (source[i] === '\\') { i += 2; continue; }
            if (source[i++] === quote) {
              if (source[i] === quote) { i++; continue; }
              closed = true;
              break;
            }
          }
          if (!closed) return null;
          tipo = 'texto';
        } else {
          const word = source.slice(i).match(/^[\p{L}_][\p{L}\p{N}_]*/u);
          const operator = source.slice(i).match(/^[#$&*+\-./:<=>?@\\^~!]+/);
          if (word) {
            i += word[0].length;
            tipo = /^[\p{Lu}_]/u.test(word[0]) ? 'variable' : 'atomo';
          } else if (operator) {
            i += operator[0].length;
            tipo = 'operador';
          } else i++;
        }
      }
      result.push({texto: source.slice(start, i), tipo, inicio: start});
    }
    return result;
  }

  function formatear(source) {
    const scanned = tokens(source);
    if (!scanned) return [{texto: source, tipo: ''}];
    const meaningful = scanned.filter(t => t.tipo !== 'espacio');
    const stack = [];
    for (const token of meaningful) {
      if (['(', '[', '{'].includes(token.texto)) stack.push(token);
      if ([')', ']', '}'].includes(token.texto)) {
        const open = stack.pop();
        if (!open || '([{'.indexOf(open.texto) !== ')]}'.indexOf(token.texto)) {
          return scanned; // Consulta incompleta: conservar su disposición original.
        }
        open.multilinea = token.inicio - open.inicio > 76;
        token.multilinea = open.multilinea;
      }
    }
    if (stack.length) return scanned;
    meaningful.forEach((token, i) => {
      if (token.tipo === 'atomo' && meaningful[i + 1]?.texto === '(') token.tipo = 'predicado';
    });
    const output = [];
    const frames = [];
    let indent = 0;
    let lineStart = true;
    let gap = false;
    function salto() {
      if (!lineStart) output.push({texto: '\n', tipo: ''});
      lineStart = true;
      gap = false;
    }
    for (const token of scanned) {
      if (token.tipo === 'espacio') { gap = true; continue; }
      const closing = [')', ']', '}'].includes(token.texto);
      if (closing) {
        const frame = frames.pop();
        if (frame?.multilinea) { indent--; salto(); }
      }
      if (lineStart) output.push({texto: '  '.repeat(indent), tipo: ''});
      else if (gap && !closing && ![',', ';', '.'].includes(token.texto)) {
        output.push({texto: ' ', tipo: ''});
      }
      output.push(token);
      lineStart = false;
      gap = false;
      if (['(', '[', '{'].includes(token.texto)) {
        frames.push(token);
        if (token.multilinea) { indent++; salto(); }
      } else if ([',', ';', '->', '*->'].includes(token.texto)) {
        if (!frames.length || frames.at(-1).multilinea) salto();
        else gap = true;
      } else if (token.texto === ':' && frames.at(-1)?.texto === '{') {
        gap = true;
      } else if (token.tipo === 'comentario' && token.texto.startsWith('%')) salto();
    }
    return output;
  }

  function renderizar(source) {
    const code = document.createElement('code');
    for (const token of formatear(source)) {
      const span = document.createElement('span');
      if (token.tipo && token.tipo !== 'espacio') span.className = `pl-${token.tipo}`;
      span.textContent = token.texto;
      code.append(span);
    }
    return code;
  }
  return {tokens, formatear, renderizar};
})();
