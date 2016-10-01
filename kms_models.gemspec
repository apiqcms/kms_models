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
  s.summary     = "Summary of KmsModels."
  s.description = "Description of KmsModels."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1"
  s.add_dependency 'friendly_id', '~> 5.0.0'
  s.add_dependency 'kms', ">= 0.3.0"

  s.add_development_dependency "sqlite3"
end
