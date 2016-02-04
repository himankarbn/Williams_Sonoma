require_relative 'abstract_page.rb'
require_relative 'product_page.rb'

class ProductTypePage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def verifyPageTitle
		expect(@@browser.title).to eql("Le Creuset Cookware, Ovenware & Oven Pans | Williams-Sonoma")
	end

	def selectAProduct
		@@browser.link(:text => 'Anchor Hocking Glass Deep Pie Dish').when_present.click		
		return ProductPage.new(@@browser)
	end

end