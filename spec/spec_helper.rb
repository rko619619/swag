require 'capybara'
require 'capybara/rspec'
require 'webdrivers'
require 'site_prism'
require 'site_prism/all_there'
require 'pry'
require 'pry-byebug'

Dir["#{File.dirname(__FILE__)}/pages/**/*.rb"].each { |file| require file.to_s }

Capybara.run_server = false
Capybara.default_driver = :selenium

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
