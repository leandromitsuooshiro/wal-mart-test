require 'capybara'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara/cucumber'

Capybara.default_driver = :selenium
Capybara.run_server = false
Capybara.default_selector = :css
Capybara.default_wait_time = 30
