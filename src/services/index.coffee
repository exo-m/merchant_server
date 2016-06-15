{ assign } = Object
fetch = require 'node-fetch'

resource =
  host: 'http://test.api.2bao.org'
  version: '/v1.1/'
  pic_domain: 'http://tooboo.b0.upaiyun.com'
  # host: 'localhost'
  # port: 3000
  # router:
  #   todos: 'todos'

url = do ->
  baseUrl: "#{resource.host}#{resource.version}"
  pic_domain: "#{resource.pic_domain}"

Todos = (
  require './Todos'
) fetch, url

module.exports = assign {}
, Todos
