const {test} = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const context = vm.createContext({});
vm.runInContext(fs.readFileSync(path.join(__dirname, '../web/prolog-format.js'), 'utf8'), context);
const formatter = vm.runInContext('PrologFormato', context);
const format = source => formatter.formatear(source).map(t => t.texto).join('');
const lexical = source => JSON.stringify(formatter.tokens(source)
  .filter(t => t.tipo !== 'espacio').map(t => t.texto));

test('separa objetivos y agrega sangría a filtros extensos', () => {
  const source = 'registro(squads, _{tournament_id:"WC-2022",team_name:"Argentina",given_name:Nombre,family_name:Apellido}), sort(Nombres,Ordenados)';
  const result = format(source);
  assert.match(result, /registro\(\n  squads,/);
  assert.match(result, /\n    tournament_id:/);
  assert.match(result, /\),\nsort\(Nombres, Ordenados\)/);
  assert.equal(lexical(result), lexical(source));
});

test('preserva literales, operadores, números y comentarios', () => {
  const queries = [
    'findall(Nombre, (jugador(J, Nombre, _), goles_jugador(J, 2022, Goles), Goles >= 2), Nombres), sort(Nombres, Unicos)',
    `registro(players, _{family_name:"O'Brien, (Jr.)", given_name:"a\\\"b"}), X = 'don''t; split'`,
    'X = 1.25e-3, Y is -2, X =\\= Y, Z =.. [f, X, Y]',
    "X = 0',, Y = 16'ff, Z = 0'\\n, W = 0xff",
    'campeon(2022,E), % No dividir (este, comentario)\nequipo(E,N,_)',
    '/* externo /* interno */ final */ (a(X) -> b(X); c(X))',
    'registro(players, _{family_name:"<img src=x onerror=alert(1)>"})',
  ];
  for (const source of queries) assert.equal(lexical(format(source)), lexical(source), source);
});

test('conserva consultas incompletas para mostrar el error original', () => {
  for (const source of ['findall(X, (foo(X),', 'foo("sin cerrar, bar(X)', '/* sin cerrar']) {
    assert.equal(format(source), source);
  }
});

test('distingue predicados, variables, números y textos', () => {
  const values = formatter.formatear('campeon(2022, Equipo), Nombre = "Argentina"');
  for (const [texto, tipo] of [['campeon', 'predicado'], ['2022', 'numero'],
    ['Equipo', 'variable'], ['"Argentina"', 'texto']]) {
    assert(values.some(t => t.texto === texto && t.tipo === tipo));
  }
});
