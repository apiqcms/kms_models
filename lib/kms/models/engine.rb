require "friendly_id"
module Kms
  module Models
    class Engine < ::Rails::Engine
      engine_name 'kms_models'
      isolate_namespace Kms::Models
      config.eager_load_paths += Dir["#{config.root}/lib/**/"]
      config.to_prepare do
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          require_dependency(c)
        end
      end

      initializer "kms_models.register_models_collections" do |app|
        app.config.after_initialize do
          Kms::Model.pluck(:collection_name).each do |collection_name|
            Kms::ModelsWrapperDrop.register_model collection_name
          end if Kms::Model.table_exists?
        end
      end
    end
  end
end
