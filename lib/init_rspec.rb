require 'rspec'
require 'watir'
require 'require_all'
require 'rubygems'
require 'rubygems/package'
require 'selenium-webdriver'

begin
  require_all './lib/'
rescue
  puts 'No object found'
end

RSpec.configure do |config|
  config.before(:all) {
                        @browser = Watir::Browser.new :chrome
                        @main = Main.new(@browser)
                        @main.goto_eatapp
                      }

  config.after(:all) { @browser.close }
end
