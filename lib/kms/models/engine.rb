require "friendly_id"
module Kms
  module Models
    class Engine < ::Rails::Engine
      engine_name 'kms_models'
      isolate_namespace Kms::Models
      config.autoload_paths += Dir["#{config.root}/lib/**/"]
      config.to_prepare do
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          require_dependency(c)
        end
      end
    end
  end
end