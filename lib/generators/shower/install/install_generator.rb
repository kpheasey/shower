module Shower
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)

      def add_route
        route "get '/stream', to: 'shower/stream#index'"
      end

      def include_javascript
        template 'shower.js.coffee', 'app/assets/javascripts/shower.js.coffee'
      end

    end
  end
end