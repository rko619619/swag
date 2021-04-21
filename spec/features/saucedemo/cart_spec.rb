feature 'Cart' do
  let(:login_page)      { LoginPage.new    }
  let(:products_page)   { ProductsPage.new }
  let(:cart_page)       { CartPage.new     }
  let(:product_page)    { ProductPage.new  }

  before { login_page.login(VALID_NAME, VALID_PASSWORD) }

  it 'user is able to add one product to cart from products page and remove product', tag: 'smoke' do
    pages = { 'products_page' => products_page, 'product_page' => product_page }
    pages.each do |key, value|
      # reset all products from carts
      products_page.click_on_reset_btn
      visit PRODUCTS_PAGE
      products_page.click_on_product if key == 'product_page'

      information_products = value.get_information_attributes

      # add a product
      value.add_product_to_cart

      # check attributtes
      expect(value.get_count_of_cart).to eq '1'
      value.click_on_cart_icon

      information_cart = cart_page.get_information_attributes
      expect(information_cart).to eq information_products

      # remove a product
      cart_page.click_on_remove_btn

      # check attributes
      expect(page).not_to have_content information_cart
      expect(cart_page.get_count_of_cart).to eq ''
    end
  end
end
