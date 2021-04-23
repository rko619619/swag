class SimpleFormPage < SitePrism::Page
  element :single_input_field, ".form-control[id='user-message']"
  element :first_input_field, '#sum1'
  element :second_input_field, '#sum2'
  element :get_total_btn, '#gettotal > button'
  element :show_message_btn, '#get-input > button'
  element :message, '#display'
  element :total, '#displayvalue'

  def fill_single_filed
    single_input_field.set(MESSAGE_SINGLE_FIELD)
    show_message_btn.click
  end

  def fill_multiple_field(value1, value2)
    first_input_field.set(value1)
    second_input_field.set(value2)
    get_total_btn.click
  end

  def get_message
    message.text
  end

  def get_total
    total.text
  end
end
