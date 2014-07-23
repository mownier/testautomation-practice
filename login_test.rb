require "test/unit"
require "watir-webdriver"
require "logger"

class LoginTest < Test::Unit::TestCase

=begin
	Step 1: Open browser
	Step 2: Go to 'https://www.groupjump.com'
	Step 3: Click 'Login' link
	Step 4: Enter email address
	Step 5: Enter address
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
		logger.info(":::: START TESTING login_test_case_1")

		# Step 1: Open browser
		logger.info("Step 1: Open browser")
		b = Watir::Browser.new :ff

		# Step 2: Go to 'https://www.groupjump.com'
		logger.info("Step 2: Go to 'https://www.groupjump.com'")
		b.goto("https://www.groupjump.com")

		# Step 3: Click 'Login' link
		logger.info("Step 3: Click 'Login' link")
		b.link(:href => "/login").click

		# Step 4: Enter email address
		logger.info("Step 4: Enter email address")
		b.text_field(:id => "email").set("mounir@nextixsystems.com")

		# Step 5: Enter address
		logger.info("Step 5: Enter address")
		b.text_field(:id => "password").set("zUIpfTGE")

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
		logger.info("::: END TESTING login_test_case_1 :::")
	end
end

