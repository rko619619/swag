class CartPage < SitePrism::Page
  element :cart_count, '.shopping_cart_link'
  element :cart_name, '#item_4_title_link > div'
  element :cart_description, '.inventory_item_desc'
  element :cart_count, '.cart_quantity'
  element :cart_price, '.inventory_item_price'
  element :cart_button, '.btn_primary'
  element :cart_remove, '.btn_small'
  element :cart_icon, '.shopping_cart_link'

  def get_information
    [cart_name.text, cart_description.text, cart_price.text, cart_count.text]
  end

  def remove_product
    cart_remove.click
  end

  def count_cart
    cart_icon.text
  end
end
