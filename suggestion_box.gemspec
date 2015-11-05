$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "suggestion_box/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "suggestion_box"
  s.version     = SuggestionBox::VERSION
  s.authors     = ["Anton Zhirkov"]
  s.email       = ["an.zhirkov@gmail.com"]
  s.homepage    = "https://github.com/Kinnarts/suggestion_box"
  s.summary     = "Summary of SuggestionBox."
  s.description = "Description of SuggestionBox."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "slim-rails"
  s.add_dependency "acts_as_commentable"
  s.add_dependency "simple_form"
  s.add_dependency "jquery-rails"
  s.add_development_dependency "byebug"
  s.add_dependency "devise"
  s.add_dependency 'acts_as_votable', '~> 0.10.0'

  s.add_development_dependency "sqlite3"
end
