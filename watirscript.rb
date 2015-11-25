require 'watir'
require 'yaml'
browser = Watir::Browser.new :firefox
browser.goto "https://www.tumblr.com/login"

file = YAML.load_file('./logincredentials.yml')
  file["user"].each do |yml_user|
		browser.text_field(id: 'signup_email').set "#{yml_user["email"]}"
		browser.text_field(id: 'signup_password').set "#{yml_user["password"]}"
	end
browser.button(id: "signup_forms_submit").click

browser.i(class: "icon_post_text").click
browser.element(class: "editor-plaintext").send_keys "Hello World!\t"
browser.element(class: "editor-richtext").send_keys "This is my text\t #watir"
browser.element(class: "create_post_button").click
browser.goto "jagritgyawali.tumblr.com"
browser.alert.ok

verification = browser.elements(class: "body-text")
verification.each do |a| 
  if a.text.match /This is my text/
		puts "#{a.text},\nThe post has been successfully made and listed in dashboard!"
		break;
	else
		puts "The post could not be found"
  end
end