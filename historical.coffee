[coffee, cmd, symbol, from, to, rest...] = process.argv
Promise = require 'bluebird'
stringify = Promise.promisify require 'csv-stringify'
yahoo = Promise.promisifyAll require 'yahoo-finance'

yahoo
  .historicalAsync
    symbol: symbol
    from: from || null
    to: to || null
  .then (res) ->
    stringify res, header: true
  .then console.log, console.error
