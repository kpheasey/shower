module Shower
  class Stream

    # Publish a message to the gemgento_message stream
    #
    # @param [String] event
    # @param [Hash] Message
    def self.publish(event, message)
      $redis.publish(event, message.to_json)
    end

  end
end