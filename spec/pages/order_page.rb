class OrderPage < SitePrism::Page
  element :order_first_name, '#first-name'
  element :order_last_name, '#last-name'
  element :order_postal_code, '#postal-code'
  element :continue_btn, '#continue'
  element :order_name, '.inventory_item_name'
  element :order_description, '.inventory_item_desc'
  element :order_price, '.inventory_item_price'
  element :shipping_information, :xpath, '//*[@id="checkout_summary_container"]/div/div[2]/div[4]'
  element :order_item_total, '.summary_subtotal_label'
  element :order_item_tax, '.summary_tax_label'
  element :order_total, '.summary_total_label'
  element :finish_btn, '.btn_action'
  element :complete_header, '.complete-header'
  element :complete_text, '.complete-text'
  element :complete_img, '.pony_express'

  def checkout_information(test_data)
    order_first_name.set(test_data)
    order_last_name.set(test_data)
    order_postal_code.set(test_data)
    continue_btn.click
  end

  def get_information_attributes
    [order_name.text, order_description.text, order_price.text, '1']
  end

  def get_shipping_information
    shipping_information.text
  end

  def get_total_price
    [order_item_total.text, order_item_tax.text, order_total.text]
  end

  def get_convert_price
    order_item_price = order_price.text
    order_item_total = order_item_price[1..-1].to_f
    order_item_tax = format('%.2f', (order_item_total * 0.08))
    order_total = (order_item_total + order_item_tax.to_f)
    ["Item total: $#{order_item_total}", "Tax: $#{order_item_tax}", "Total: $#{order_total}"]
  end

  def click_on_finish_btn
    finish_btn.click
  end

  def get_complete_data
    [complete_header.text, complete_text.text, complete_img['src']]
  end
end
