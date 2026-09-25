const test = require('node:test')
const assert = require('node:assert')
const { additionner } = require('./index')

test('2 + 3 vaut 6', () => {
  assert.strictEqual(additionner(2, 3), 6)
})