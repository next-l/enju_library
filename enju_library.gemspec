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
  s.test_files = Dir["spec/**/*"] - Dir["spec/dummy/log/*"] - Dir["spec/dummy/solr/{data,pids}/*"]

  s.add_dependency "enju_seed", "~> 0.2.0.pre6"
  s.add_dependency "geocoder"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "2.99"
  s.add_development_dependency "vcr"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "paperclip", "~> 4.1"
  #s.add_development_dependency "enju_leaf", "~> 1.2.0.pre1"
  #s.add_development_dependency "enju_manifestation_viewer", "~> 0.2.0.pre1"
  #s.add_development_dependency "enju_biblio", "~> 0.2.0.pre1"
  #s.add_development_dependency "enju_event", "~> 0.2.0.pre1"
  #s.add_development_dependency "enju_circulation", "~> 0.2.0.pre1"
  #s.add_development_dependency "enju_inter_library_loan", "~> 0.2.0.pre1"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "redcarpet"
  s.add_development_dependency "elasticsearch-extensions"
  s.add_development_dependency "annotate"
end
