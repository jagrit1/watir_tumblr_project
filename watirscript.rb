require 'watir'
require 'yaml'
$LOAD_PATH<<'.'
require 'TumblrAutomation'
include Tumblr
class TumblrTest
  browser = Watir::Browser.new :firefox
  browser.goto "https://www.tumblr.com/login"
  file = YAML.load_file('./logincredentials.yml')
  email = file["email"]
  password = file["password"]
  TumblrTest.new.login(email, password, browser)
  TumblrTest.new.post(browser)
  TumblrTest.new.navigate(browser)
  TumblrTest.new.verification(browser)
  TumblrTest.new.deletepost(browser)
  TumblrTest.new.teardown(browser)
end
