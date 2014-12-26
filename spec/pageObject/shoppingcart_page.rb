require_relative 'abstract_page.rb'
require 'rspec'
require 'watir-webdriver'

class ShoppingcartPage < AbstractPage

	def initialize (browser)
		super(browser)
	end

	def verifyItemInShoppingCart
		return @@browser.div(:class, "order-item-title").text
	end

end