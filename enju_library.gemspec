$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "enju_library/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "enju_library"
  s.version     = EnjuLibrary::VERSION
  s.authors     = ["Kosuke Tanabe"]
  s.email       = ["nabeta@fastmail.fm"]
  s.homepage    = "https://github.com/next-l/enju_library"
  s.summary     = "enju_library plugin"
  s.description = "Library module for Next-L Enju"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/{log,private,solr,tmp}/**/*"]

  s.add_dependency "enju_seed", "~> 0.5.0.beta.1"
  s.add_dependency "geocoder"
  s.add_dependency "statesman", "~> 5.0"
  s.add_dependency "mini_magick"

  s.add_development_dependency "enju_leaf", "~> 3.0.0.beta.1"
  s.add_development_dependency "enju_biblio", "~> 0.5.0.beta.1"
  s.add_development_dependency "enju_message", "~> 0.5.0.beta.1"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.8"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.5"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "kramdown"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "coveralls"
  s.add_development_dependency "capybara", "~> 3.11"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "puma"
  s.add_development_dependency "annotate", "~> 2.7"
end
