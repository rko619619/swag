class ProductPage < SitePrism::Page
  element :product_name, '.inventory_details_name'
  element :product_description, '.inventory_details_desc'
  element :product_price, '.inventory_details_price'
  element :product_button, '.btn_primary'
  element :product_remove, '.btn_small'
  element :cart_icon, '.shopping_cart_link'

  def get_information
    [product_name.text, product_description.text, product_price.text, '1']
  end

  def add_product_to_cart
    product_button.click
  end

  def count_cart
    cart_icon.text
  end

  def cart_icon_click
    cart_icon.click
  end
end
