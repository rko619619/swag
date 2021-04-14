class ProductsPage < SitePrism::Page
  element :about_btn, :xpath, '//*[@id="about_sidebar_link"]'
  element :reset_btn, '#reset_sidebar_link'
  element :menu_btn, '#react-burger-menu-btn'
  element :cart_icon, '.shopping_cart_link'
  element :cross_btn, '#react-burger-cross-btn'
  element :products_name, '#item_4_title_link'
  element :products_description, :xpath, '//*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div'
  element :products_price, :xpath, '//*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div'
  element :products_btn, '#add-to-cart-sauce-labs-backpack'
  element :products_remove, '.btn_secondary'

  def social_media(social_media)
    window_opened_by { find(".social_#{social_media}").click }
  end

  def click_on_about_btn
    menu_btn.click
    about_btn.click
  end

  def click_on_reset_btn
    menu_btn.click
    reset_btn.click
  end

  def click_on_cross_btn
    cross_btn.click
  end

  def get_information_attributes
    [products_name.text, products_description.text, products_price.text, '1']
  end

  def add_product_to_cart
    products_btn.click
  end

  def click_on_cart_icon
    cart_icon.click
  end

  def get_count_of_cart
    cart_icon.text
  end

  def click_on_product
    products_name.click
  end
end
