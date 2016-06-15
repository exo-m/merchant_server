echo = console.log
dd = require 'ddeyes'
checkStatus = (res) ->
  if res.status >= 200 and res.status < 300
    return res
  else
    error = new Error res.statusText
    error.response = res
    throw error

module.exports = (fetchFun, url) ->
  cus_post: (api, params, callback) ->
    url = url.baseUrl + api
    console.log url
    promise = fetchFun url
    ,
      method: 'POST'
      headers:
        Accept: 'application/json'
        'Content-Type': 'application/json'
      body: params
    promise.then (res) ->
      checkStatus res
    .then (res) ->
      res.json()
    .then (res) ->
      callback()
      dd res
    .catch (ex) ->
      throw new Error ex
