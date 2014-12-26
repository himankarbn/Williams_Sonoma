require_relative 'home_page.rb'
require 'rspec'
require 'watir-webdriver'

class AbstractPage
	@@browser = nil

	def initialize (browser)
		@@browser = browser
		@@browser.window.resize_to 1100, 850
		@@browser.driver.manage.timeouts.implicit_wait = 60
	end

	def navigateToApp
		@@browser.goto('http://www.williams-sonoma.com')
		return HomePage.new(@@browser)
	end

	def quit
		@@browser.quit
	end

	def getPageTitle
		return @@browser.title
	end

end