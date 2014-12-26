require_relative '../pageObject/home_page.rb'
require_relative '../pageObject/abstract_page.rb'

require 'rspec'
require 'watir-webdriver'

describe 'Coding challenge' do

		app = nil

		before(:each) do
			app = AbstractPage.new(Watir::Browser.new:firefox)
		end

		after(:each) do
			app.quit
		end

		it 'Select a Product and Add to cart' do
			shoppingcart = app.navigateToApp.cancelPopUp.navigateToProductType.selectAProduct.addToCart.checkout
			expect(shoppingcart.getPageTitle).to eql("Shopping Cart | Williams-Sonoma")
			expect(shoppingcart.verifyItemInShoppingCart).to match(/Anchor Hocking Glass Deep Pie Dish/)
		end

		it 'Search a Product and Add to cart using overlay' do
			shoppingcart = app.navigateToApp.cancelPopUp.searchItem.productOverlay.addToCart.checkout
			expect(shoppingcart.getPageTitle).to eql("Shopping Cart | Williams-Sonoma")
			expect(shoppingcart.verifyItemInShoppingCart).to match(/Fiore Rigatoni Artisanal Pasta/)
		end
end
