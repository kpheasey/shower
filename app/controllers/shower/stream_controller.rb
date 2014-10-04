class Shower::StreamController < ApplicationController
    include ActionController::Live

    before_action :close_db_connection

    def index
      response.headers['Content-Type'] = 'text/event-stream'
      redis = Redis.new

      redis.subscribe(params[:events].split(',') << 'heartbeat') do |on|
        on.message do |event, data|
          response.stream.write("event: #{event}\n")
          response.stream.write("data: #{data}\n\n")
        end
      end
    rescue IOError
      # stream closed
    ensure
      # stopping stream thread
      redis.quit
      response.stream.close
    end

    private

    def close_db_connection
      ActiveRecord::Base.connection_pool.release_connection
    end

end