feature 'Order' do
  let(:login_page)      { LoginPage.new    }
  let(:products_page)   { ProductsPage.new }
  let(:product_page)    { ProductPage.new  }
  let(:cart_page)       { CartPage.new     }
  let(:order_page)      { OrderPage.new    }
  before { login_page.login(VALID_NAME, VALID_PASSWORD) }

  it 'user is able to order product from products page and product page', tag: 'smoke' do
    pages = { 'products_page' => products_page, 'product_page' => product_page }
    pages.each do |key, value|
      # reset all products from carts
      products_page.click_on_reset_btn
      visit(PRODUCTS_PAGE)
      products_page.click_on_product if key == 'product_page'

      # add a product
      value.add_product_to_cart

      # click on cart_page
      value.click_on_cart_icon
      information_cart = cart_page.get_information_attributes

      # checkout order
      value.click_on_checkout_btn

      # set information for order
      order_page.checkout_information(ORDER_DATA)

      # check correct order attributes
      expect(order_page.get_information_attributes).to eq information_cart
      expect(order_page.get_shipping_information).to eq SHIPPING_INFORMATION
      expect(order_page.get_total_price). to eq order_page.get_convert_price
      order_page.click_on_finish_btn

      # check a successful order
      expect(order_page.get_complete_data).to eq [COMPLETE_HEADER, COMPLETE_TEXT, COMPLETE_IMG_URL]
    end
  end
end
