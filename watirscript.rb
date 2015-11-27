require 'watir'
require 'yaml'
$LOAD_PATH<<'.'
require 'TumblrAutomation'
include Tumblr
class TumblrTest
  a = TumblrTest.new
  browser = Watir::Browser.new :firefox
  browser.goto "https://www.tumblr.com/login"
  file = YAML.load_file('./logincredentials.yml')
  email = file["email"]
  password = file["password"]
  a.login(email, password, browser)
  a.post(browser)
  a.navigate(browser)
  a.verification(browser)
  a.teardown(browser)
end
