# Shower

Shower allows the creation of an unlimited number of event streams through a single connection!

## Installation

Add this line to your application's Gemfile:

    gem 'shower'

And then execute:

    $ bundle
    
After bundling you need to run the initial installation generator:

    $ rails g shower:install

## Usage
### Publishing

Pushing messages to an event stream is simple, just pass the event name and the data.  The data will be converted to
JSON using ```to_json```.

    Shower::Stream.publish('message.new', { username: 'anon', message: 'hello!' })


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
