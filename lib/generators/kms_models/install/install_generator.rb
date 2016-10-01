module KmsModels
  class InstallGenerator < Rails::Generators::Base

    source_root File.expand_path('../../../../../', __FILE__)

    def insert_engine_routes
      route %(
  mount Kms::Models::Engine => '/kms'
      )
    end

    def insert_javascript
      append_file "app/assets/javascripts/application.js", "//= require kms_models/application\n"
    end

  end
end
