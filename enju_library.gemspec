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

  s.add_dependency "enju_seed", "~> 0.4.0.rc.2"
  s.add_dependency "geocoder"
  s.add_dependency "statesman", "~> 7.4"
  s.add_dependency "mini_magick", '~> 4.10'
  s.add_dependency "paperclip-meta"
  s.add_dependency "paper_trail"

  s.add_development_dependency "enju_leaf", "~> 2.0.0.rc.1"
  s.add_development_dependency "enju_manifestation_viewer", "~> 0.4.0.rc.1"
  s.add_development_dependency "enju_message", "~> 0.4.0.rc.1"
  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 4.0"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "sunspot_solr", "~> 2.5"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "kramdown"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "coveralls", '~> 0.8.23'
  s.add_development_dependency "capybara"
  s.add_development_dependency "selenium-webdriver"
  s.add_development_dependency "puma"
  s.add_development_dependency "annotate"
end
