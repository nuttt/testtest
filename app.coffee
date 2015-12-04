spinal = require './lib/spinal.coffee'
config = require './config'
bunny = require('bunnycron')
  cronFile: __dirname
  redis: 
    host: config.redis.host
    port: config.redis.port
bunny.startCron()

module.exports = (options={}) ->
  unless options.server or options.server is false
    spinal.start ->
      console.log "#{config.code_name}(#{process.env.NODE_ENV}) listening :#{this.port}"
      for method, val of spinal._methods
        console.log "- #{method}"

  options.onReady() if options.onReady?
  return spinal
