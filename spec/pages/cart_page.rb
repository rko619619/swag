class BasketOnMainPage < SitePrism::Page
  element :basket_on_page, '.shopping_cart_link'
  element :basket, '.inventory_item_name'
  element :item_name, '#item_4_title_link'
  element :item_description, :xpath, '//*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div'
  element :item_button, '#add-to-cart-sauce-labs-backpack'
  element :item_remove, '.btn_secondary'

  # modal cart
end

class Basket < SitePrism::Page
  element :basket_count, '.shopping_cart_link'
  element :item_name, '#item_4_title_link > div'
  element :item_description, '.inventory_item_desc'
  element :item_count, '.cart_quantity'
  element :item_button, '.btn_primary'
  element :item_remove, '.btn_small'
end

class Item < SitePrism::Page
  element :item_name, '.inventory_details_name'
  element :item_description, '.inventory_details_desc'
  element :item_button, '.btn_primary'
  element :item_remove, '.btn_small'
end
