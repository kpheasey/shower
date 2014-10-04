require 'coffee-rails'
require 'redis'

module Shower
  class Engine < ::Rails::Engine
    isolate_namespace Shower
    engine_name 'shower'

    config.autoload_paths += %W(#{config.root}/lib/**/)
  end
end
