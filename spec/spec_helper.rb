require 'simplecov'
require 'coveralls'
SimpleCov.start 'rails'
Coveralls.wear!

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'vcr'
require 'factory_girl'
require 'sunspot-rails-tester'
require 'rspec/active_model/mocks'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
#Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/../../spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  config.extend ControllerMacros, :type => :controller

  $original_sunspot_session = Sunspot.session

  config.before do
    Sunspot.session = Sunspot::Rails::StubSessionProxy.new($original_sunspot_session)
  end

  config.before :each, :solr => true do
    Sunspot::Rails::Tester.start_original_sunspot_session
    Sunspot.session = $original_sunspot_session
    Sunspot.remove_all!
  end

  config.infer_spec_type_from_file_location!
end

FactoryGirl.definition_file_paths << "#{::Rails.root}/../../spec/factories"
FactoryGirl.find_definitions
