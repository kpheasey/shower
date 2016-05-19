module Shower
  class Stream

    # Publish a message to the gemgento_message stream
    #
    # @param [String] event
    # @param [Hash] Message
    def self.publish(event, message)
      $redis.publish(event, message.to_json)
    end

    # Yield event and data back to subscribed entity
    #
    # @param [Array] events
    def self.subscribe(events)
      $redis.subscribe(events << 'heartbeat') do |on|
        on.message do |event, data|
          yield(event, data)
        end
      end
    end

  end
end
