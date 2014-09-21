require 'enju_seed'
require 'geocoder'
require 'ipaddr'
require "protected_attributes" if Rails::VERSION::MAJOR == 4

module EnjuLibrary
  class Engine < ::Rails::Engine
  end
end
