module Tumblr
class TumblrTest
  
def login(email, password, browser)
  file = YAML.load_file('./logincredentials.yml')
  browser.text_field(id: 'signup_email').set file["user"][0]["email"]
  browser.text_field(id: 'signup_password').set file["user"][0]["password"]
  browser.button(id: "signup_forms_submit").click
end

def post(browser)

  browser.i(class: "icon_post_text").click
  browser.element(class: "editor-plaintext").send_keys "World!\t"
  browser.element(class: "editor-richtext").send_keys "This is my text\t #watir"
  browser.element(class: "create_post_button").click
end

def navigate(browser)

  browser.goto "jagritgyawali.tumblr.com"
  browser.alert.ok
end

def verification(browser)
verification = browser.elements(class: "body-text")
verification.each do |a| 
  if a.text.match /This is my text/
		puts "#{a.text},\nThe post has been successfully made and listed in dashboard!"
		break;
	else
		puts "The post could not be found"
  end
  end

end
 def deletepost(browser)
  browser.goto "https://www.tumblr.com/blog/jagritgyawali"
  browser.div(class: "post_control").click
  browser.div(class: "post_control delete").click
  browser.button(class: "chrome blue").click
  puts "The blog has been deleted as well"
end

def teardown (browser)
  browser.close
end
end
end