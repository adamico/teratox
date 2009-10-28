# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] ||= 'test'
require File.dirname(__FILE__) + "/../config/environment" unless defined?(RAILS_ROOT)
require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'webrat'
require 'webrat/core/matchers/have_tag'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

Dir["#{File.dirname(__FILE__)}/spec_helpers/**/*.rb"].each {|f| require f}

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  config.include Webrat::Matchers, :type => :view
  config.include Webrat::HaveTagMatcher, :type => :view
  config.include ControllerHelpers, :type => :controller
  config.extend ControllerMacros, :type => :controller

  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  # config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  #
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  #
  # For more information take a look at Spec::Runner::Configuration and Spec::Runner
end

module Spec::Mocks::Methods
  def stub_association!(association_name, methods_to_be_stubbed ={})
    mock_assn = Spec::Mocks::Mock.new(association_name.to_s)
    stub_association_with(association_name, mock_assn, methods_to_be_stubbed)
  end

  def stub_association_with(association_name, values, methods_to_be_stubbed ={})
    methods_to_be_stubbed.each do |meth, return_value|
      values.stub!(meth).and_return(return_value)
    end
    yield(values) if block_given?

    self.stub!(association_name).and_return(values)
  end
end
