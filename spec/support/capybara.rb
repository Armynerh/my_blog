require 'capybara/rspec'
require 'selenium/webdriver'

Capybara.server = :puma
Capybara.default_max_wait_time = 10
Capybara.javascript_driver = :selenium_chrome_headless
