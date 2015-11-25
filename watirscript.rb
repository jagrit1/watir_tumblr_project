require 'watir'
browser = Watir::Browser.new :firefox
browser.goto "https://www.tumblr.com/login"
browser.text_field(id: "signup_email").set "jaggywali@gmail.com"
browser.text_field(id: "signup_password").set "spartaglobal"
browser.button(id: "signup_forms_submit").click

browser.i(class: "icon_post_text").click
browser.element(class: "editor-plaintext").send_keys "Hello World!\t"
browser.element(class: "editor-richtext").send_keys "This is my text\t #watir"
browser.element(class: "create_post_button").click

verification = browser.elements(class: "post_body")
verification.each do |a| 
  if a.text.match /This is my text/
		puts "#{a.text},\nThe post has been successfully made and listed in dashboard!"
		break;
	else
		puts "The post could not be found"
  end
end

browser.close