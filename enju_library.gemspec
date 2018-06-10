$:.push File.expand_path("../lib", __FILE__)

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

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids,default,development,test}/*"] - Dir["spec/dummy/tmp/*"]

  s.add_dependency "geocoder"
  s.add_dependency "cocoon"
  # s.add_dependency "enju_biblio", "~> 0.2.0"
  s.add_dependency "shrine"
  s.add_dependency "image_processing"
  s.add_dependency "fastimage"
  s.add_dependency "mini_magick"

  s.add_development_dependency "pg"
  s.add_development_dependency "rspec-rails", "~> 3.5"
  s.add_development_dependency "webmock"
  s.add_development_dependency "factory_bot_rails"
  # s.add_development_dependency "enju_leaf", "~> 1.2.0"
  # s.add_development_dependency "enju_ndl", "~> 0.2.0"
  # s.add_development_dependency "enju_manifestation_viewer", "~> 0.2.0"
  # s.add_development_dependency "enju_event", "~> 0.2.0"
  # s.add_development_dependency "enju_circulation", "~> 0.2.0"
  # s.add_development_dependency "enju_inter_library_loan", "~> 0.2.0"
  s.add_development_dependency "sunspot_solr", "2.2.0"
  s.add_development_dependency "resque"
  s.add_development_dependency "kramdown"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sunspot-rails-tester"
  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "redis-rails"
  # s.add_development_dependency "database_cleaner"
end
