# Shower

Shower allows the creation of an unlimited number of event streams through a single connection!  Server side events have never been easier and more efficient.  Since there is no needed to persist a database connection, the amount of concurrent users is only limited by your Rails server.

## Requirements

### Multithreaded Server

As with any application wishing to use ```ActionController::Live```, a multithreaded server is required.  I recommend, [Puma](http://puma.io/), it's open source and free.  [Passenger Enterprise](https://www.phusionpassenger.com/enterprise) is another option, it's a little simpler to setup then Puma.


### Redis
A Redis server must be installed and running.  Messages are pushed to a Redis server, where the ```Shower::StreamController``` then picks them up and pushes them to the event stream.  Because of this, the event stream does not need a database connection!


## Installation

Add this line to your application's Gemfile:

    gem 'shower'

And then execute:

    $ bundle
    
After bundling you need to run the initial installation generator for javascript client usage:

    $ rails g shower:install

## Configuration

Create `config/initializers/redis.rb` and configure Redis connection:
    
    $redis = Redis.new(host: '127.0.0.1', port: 6379)

## Usage
### Publishing

Pushing messages to an event stream is simple, just pass the event name and the data.  The data will be converted to
JSON using ```to_json```.

    Shower::Stream.publish('message.new', { username: 'anon', message: 'hello!' })

### Subscription

Subscribing to an event stream on server side.

    Shower::Stream.subscribe(['message.new']) do |event, data| 
      # do something with event
      # do something with data
    end

### Listening

To listen for messages, use the JavaScript ```Shower``` class.  The constructor takes the path and an array of events.

    stream = new Shower('/stream', ['message.new', 'alert.new'])

Now define a callback for each event.

```
stream.addEventListener('message.new', (event) ->
  message = JSON.parse(event.data)
  console.log 'new message:'
  console.log message
)

stream.addEventListener('alert.new', (event) ->
  alert(event.data)
)

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails_script/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
