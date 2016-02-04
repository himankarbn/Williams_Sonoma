require_relative 'abstract_page.rb'
require_relative 'shoppingcart_page.rb'
require 'rspec'
require 'watir-webdriver'

class ProductPage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def productOverlay
		@@browser.element(:xpath => "//li[contains(.,'Fiore Rigatoni')]/div").when_present.hover
		sleep 3
		@@browser.element(:xpath => "//li[contains(.,'Fiore Rigatoni')]/div").element(:class => 'quicklook-link').click
		return ProductPage.new(@@browser)
	end

	def addToCart
		@@browser.button(:text => 'Add to Cart').click
		return ProductPage.new(@@browser) 
	end

	def checkout
		@@browser.element(:id => 'anchor-btn-checkout').click
		return ShoppingcartPage.new(@@browser)
	end
end