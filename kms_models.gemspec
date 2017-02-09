$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kms/models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kms_models"
  s.version     = Kms::Models::VERSION
  s.authors     = ["Igor Petrov"]
  s.email       = ["garik.piton@gmail.com"]
  s.homepage    = "http://webgradus.ru"
  s.summary     = "Extension for KMS"
  s.description = "KMS Models allows to define custom models on-the-fly."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'kms', ">= 0.6.0"

  s.add_development_dependency 'combustion', '~> 0.5.4'
  s.add_development_dependency 'factory_girl_rails', '~> 4.8'
  s.add_development_dependency 'rspec-rails', '~> 3.5', '>= 3.5.0'
  s.add_development_dependency 'shoulda-matchers', '~> 3.1'
end
