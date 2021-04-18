class ProductPage < SitePrism::Page
  element :product_name, '.inventory_details_name'
  element :product_description, '.inventory_details_desc'
  element :product_price, '.inventory_details_price'
  element :product_btn, '.btn_primary'
  element :product_remove, '.btn_small'
  element :cart_icon, '.shopping_cart_link'
  element :checkout_btn, '.btn_action'

  def get_information_attributes
    [product_name.text, product_description.text, product_price.text, '1']
  end

  def add_product_to_cart
    product_btn.click
  end

  def get_count_of_cart
    cart_icon.text
  end

  def click_on_cart_icon
    cart_icon.click
  end

  def click_on_checkout_btn
    checkout_btn.click
  end
end
