require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'

# Using the Selenium driver as default so we can pop-open Firefox and get a
# good warm fuzzy feeling

Capybara.default_driver = :selenium


Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 120
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => http_client)
end
