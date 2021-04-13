feature 'Cart' do
  let(:login_page)      { LoginPage.new    }
  let(:products_page)   { ProductsPage.new }
  let(:cart_page)       { CartPage.new     }
  let(:product_page)    { ProductPage.new  }

  before { visit LOGIN_PAGE }
  before { login_page.fill_login_form(VALID_NAME, VALID_PASSWORD) }
  before { products_page.menu_button_reset }

  it 'add a one product to cart from products page; correct number, name, description, price is displayed on cart page' do
    information_products = products_page.get_information

    products_page.add_product_to_cart
    expect(products_page.count_cart).to eq('1')
    products_page.cart_icon_click

    information_cart = cart_page.get_information
    expect(information_cart).to eq(information_products)

    cart_page.remove_product
    expect(page).not_to have_content(information_cart)
    expect(cart_page.count_cart).to eq('')
  end

  it 'add a one product to cart from cart page; correct number, name, description, price is displayed on cart page' do
    products_page.click_on_product
    information_product = product_page.get_information

    product_page.add_product_to_cart
    expect(product_page.count_cart).to eq('1')
    product_page.cart_icon_click

    information_cart = cart_page.get_information
    expect(information_cart).to eq(information_product)

    cart_page.remove_product
    expect(page).not_to have_content(information_cart)
    expect(cart_page.count_cart).to eq('')
  end
end
