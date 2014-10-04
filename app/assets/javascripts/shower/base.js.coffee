class @Shower
  path: ''
  events: new Array()
  stream: undefined

  constructor: (@path, @events) ->
    @start()
    return this


  start: =>
    unless @stream?
      @stream = new EventSource(@path + '?events=' + @events.join(','))


  stop: =>
    if @stream?
      @stream.close()
      @stream = undefined


  addEventListener: (event, callback) =>
    @start() unless @stream?
    @stream.addEventListener(event, callback)