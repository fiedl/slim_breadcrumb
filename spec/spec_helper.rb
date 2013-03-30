
ENV["RAILS_ENV"] = "test"


require File.expand_path('../../test_app/config/environment', __FILE__)

require "rspec/rails"
require 'capybara/rspec'
require "nokogiri"
require 'capybara/poltergeist'

# Load support files
#Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each{|f| require f}

RSpec.configure do |config|

  require 'rspec/expectations'

  config.include RSpec::Matchers
  config.include Rails.application.routes.url_helpers
  config.include Capybara::DSL

  Capybara.javascript_driver = :poltergeist

  config.mock_with :rspec
end


