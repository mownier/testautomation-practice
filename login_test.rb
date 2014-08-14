# ruby my_test.rb -n test_my_method

require "watir-webdriver"
require "minitest/autorun"
require "logger"
require "json"
require "pp"

class LoginTest < Minitest::Test

=begin
	Description: Happy scenario for login
	Step 1: Open browser
	Step 2: Go to 'https://www.groupjump.com'
	Step 3: Click 'Login' link
	Step 4: Enter email address
	Step 5: Enter password
	Step 6: Click 'Login' button
	Step 7: If browser url is 'https://www.groupjump.com/dashboard/flow', print TEST PASSED
	Step 8: Otherwise, print TEST FAILED
=end
	def test_login_test_case_1

		# Initialize logger
		path = File.dirname(__FILE__)
		log_name = "login_test_case_1"
		file = File.open(path + "/logs/" + log_name + ".log", File::WRONLY | File::APPEND | File::CREAT)
		logger = Logger.new(file)

		# Logs start of testing
		logger.info(":::: START TESTING " + log_name)

		# Step 1: Open browser
		logger.info("Step 1: Open browser")
		b = Watir::Browser.new :ff

		# Step 2: Go to 'https://www.groupjump.com'
		logger.info("Step 2: Go to 'https://www.groupjump.com'")
		b.goto("https://www.groupjump.com")

		# Step 3: Click 'Login' link
		logger.info("Step 3: Click 'Login' link")
		b.link(:href => "/login").click

		json = File.read("data/login_users.json")
		users = JSON.parse(json)
		existing_users = users["existing_users"]
		user = existing_users[0]

		# Step 4: Enter email address
		logger.info("Step 4: Enter email address")
		b.text_field(:id => "email").set(user["email"])

		# Step 5: Enter password
		logger.info("Step 5: Enter password")
		b.text_field(:id => "password").set(user["password"])

		# Step 6: Click 'Login' button
		logger.info("Step 6: Click 'Login' button")
		b.button(:value => "Login").click

		if b.url == "https://www.groupjump.com/dashboard/flow"
			# Step 7: If browser url is 'https://www.groupjump.com/dashboard/flow', print TEST PASSED
			logger.info("TEST PASSED")
		else
			# Step 8: Otherwise, print TEST FAILED
			logger.info("TEST FAILED")
		end

		# Logs end of testing
		logger.info(":::: END TESTING " + log_name)
	end

=begin
	Description: Test multiple existing users
=end
	def test_login_test_case_2

		# Initialize logger
		path = File.dirname(__FILE__)
		log_name = "login_test_case_2"
		file = File.open(path + "/logs/" + log_name + ".log", File::WRONLY | File::APPEND | File::CREAT)
		logger = Logger.new(file)

		# Logs start of testing
		logger.info(":::: START TESTING " + log_name)

		# Step 1: Open browser
		logger.info("Step 1: Open browser")
		b = Watir::Browser.new :ff

		# Step 2: Go to 'https://www.groupjump.com'
		logger.info("Step 2: Go to 'https://www.groupjump.com'")
		b.goto("https://www.groupjump.com")

		json = File.read("data/login_users.json")
		users = JSON.parse(json)
		existing_users = users["existing_users"]
		
		existing_users.each do |user|
			# Step 3: Click 'Login' link
			logger.info("Step 3: Click 'Login' link")
			b.link(:href => "/login").click

			# Step 4: Enter email address
			logger.info("Step 4: Enter email address")
			b.text_field(:id => "email").set(user["email"])

			# Step 5: Enter password
			logger.info("Step 5: Enter password")
			b.text_field(:id => "password").set(user["password"])

			# Step 6: Click 'Login' button
			logger.info("Step 6: Click 'Login' button")
			b.button(:value => "Login").click

			if b.url == "https://www.groupjump.com/dashboard/flow"
				# Step 7: If browser url is 'https://www.groupjump.com/dashboard/flow', print TEST PASSED
				logger.info("TEST PASSED")
			else
				# Step 8: Otherwise, print TEST FAILED
				logger.info("TEST FAILED")
			end

			b.link(:class => "css_settings").click
			b.link(:href => "/index/logout").click
		end

		# Logs end of testing
		logger.info(":::: END TESTING " + log_name)
	end

=begin
	Description: Test captcha
=end
	def test_login_test_case_3

		# Initialize logger
		path = File.dirname(__FILE__)
		log_name = "login_test_case_3"
		file = File.open(path + "/logs/" + log_name + ".log", File::WRONLY | File::APPEND | File::CREAT)
		logger = Logger.new(file)

		# Logs start of testing
		logger.info(":::: START TESTING " + log_name)

		json = File.read("data/login_users.json")
		users = JSON.parse(json)

		pp users

		# Logs end of testing
		logger.info(":::: END TESTING " + log_name)
	end
end

