require 'capybara'
require 'capybara/rspec'
require 'webdrivers'
require 'site_prism'
require 'site_prism/all_there'
require 'pry'
require 'pry-byebug'
require 'rspec/retry'
require 'capybara-screenshot/rspec'
require 'faker'

Dir["#{File.dirname(__FILE__)}/pages/**/*.rb"].each { |file| require file.to_s }

# config for screenshot
FileUtils.rm_rf Dir.glob('spec/tmp/*')
FileUtils.rm_rf Dir.glob('html_report/*')

Capybara.save_path = 'spec/tmp'
Capybara::Screenshot.prune_strategy = :keep_last_run

Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
  "screenshot_#{example.description.tr(' ', '-').gsub(/^.*\/spec\//, '')}"
end

# config for drive
Capybara.run_server = false
Capybara.default_driver = :selenium_chrome

# Capybara.default_driver = case ENV['DRIVER']
#                           when 'selenium_chrome'
#                             :selenium_chrome
#                           when 'selenium_firefox'
#                             :selenium_firefox
#                           end

Capybara.register_driver :selenium_chrome do |app|
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << '--start-maximized'
    #opts.args << '--headless'
    opts.args << '--disable-extensions'
  end
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
end

Capybara.register_driver :selenium_firefox do |app|
  browser_options = ::Selenium::WebDriver::Firefox::Options.new.tap do |opts|
    opts.args << '--start-maximized'
    #opts.args << '--headless'
    opts.args << '--disable-extensions'
  end
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: browser_options)
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.formatter = :documentation
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # config retry
  config.verbose_retry = true
  config.display_try_failure_messages = true

  config.around do |ex|
    ex.run_with_retry retry: 1
  end

  config.retry_callback = proc do |_ex|
    Capybara.reset!
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
