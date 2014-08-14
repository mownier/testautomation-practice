require "watir-webdriver"
require "minitest/autorun"

class RegisterTest < Minitest::Test

	def test_register_test_case_1

		browser = Watir::Browser.new :ff
		browser.goto "tiaotuan.com"

		browser.button(:id => "register-go").click
		browser.text_field(:name => "first_name").set("Gee Jay")
		browser.text_field(:name => "last_name").set("Groupjump")
		browser.text_field(:placeholder => "Username").set("iamgeejay")
		browser.text_field(:name => "email").set("geejay@groupjump.ph")
		browser.text_field(:name => "password", :placeholder => "Password", :visible => true).set("password")
		browser.text_field(:placeholder => "Confirm Password").set("password")
	end
end