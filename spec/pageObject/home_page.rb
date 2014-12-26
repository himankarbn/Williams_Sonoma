require_relative 'abstract_page.rb'
require_relative 'producttype_page.rb'

class HomePage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def cancelPopUp
		@@browser.element(:css => "#ad_email_btn-close").click
		return HomePage.new(@@browser)
	end

	def navigateToProductType
		@@browser.element(:xpath => "//nav[@id='topnav-container']/ul/li/a[contains(.,'Cookware')]").when_present.hover
		sleep 3  
		@@browser.link(:text => 'Ovenware').when_present.click
		return ProductTypePage.new(@@browser)	
	end

	def searchItem
		@@browser.text_field(:id => 'search-field').set("pasta")
		@@browser.form(:name => 'navSearchBox').element(:text => 'Search').click
		return ProductPage.new(@@browser)
	end
end