require 'rubygems'
require 'bundler/setup'

require 'combustion'
require 'shoulda/matchers'

Combustion.initialize! :all

require 'rspec/rails'
require 'factory_girl_rails'
require 'devise'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros, type: :controller
  config.include Requests::JsonHelpers, type: :controller
  config.color = true
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
end
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end
