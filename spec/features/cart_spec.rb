feature 'Cart' do
  let(:login_page)      { LoginPage.new    }
  let(:products_page)   { ProductsPage.new }
  let(:cart_page)       { CartPage.new     }
  let(:product_page)    { ProductPage.new  }

  before :each do
    login_page.login(VALID_NAME, VALID_PASSWORD)
  end

  context 'add a one product to cart from products page and product page, and than remove ' do
    it 'check correct number, name, description, price is displayed on cart page' do
      pages = { 'products_page' => products_page, 'product_page' => product_page }
      pages.each do |key, value|
        products_page.click_on_reset_btn
        if key == 'product_page'
          products_page.click_on_product
        end
        information_products = value.get_information_attributes

        value.add_product_to_cart
        expect(value.get_count_of_cart).to eq('1')
        value.click_on_cart_icon

        information_cart = cart_page.get_information_attributes
        expect(information_cart).to eq(information_products)

        cart_page.click_on_remove_btn
        expect(page).not_to have_content(information_cart)
        expect(cart_page.get_count_of_cart).to eq('')
        visit(PRODUCTS_PAGE)
      end
    end
  end
end
