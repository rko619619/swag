class ProductsPage < SitePrism::Page
  element :about, :xpath, '//*[@id="about_sidebar_link"]'
  element :reset, '#reset_sidebar_link'
  element :menu_button, '#react-burger-menu-btn'
  element :cart_icon, '.shopping_cart_link'
  element :products_name, '#item_4_title_link'
  element :products_description, :xpath, '//*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div'
  element :products_price, :xpath, '//*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div'
  element :products_button, '#add-to-cart-sauce-labs-backpack'
  element :products_remove, '.btn_secondary'

  def social_media(social_media)
    window_opened_by { page.find(".social_#{social_media}").click }
  end

  def menu_button_click
    menu_button.click
    about.click
  end

  def menu_button_reset
    menu_button.click
    reset.click
  end

  def get_information
    [products_name.text, products_description.text, products_price.text, '1']
  end

  def add_product_to_cart
    products_button.click
  end

  def cart_icon_click
    cart_icon.click
  end

  def count_cart
    cart_icon.text
  end

  def click_on_product
    products_name.click
  end
end
