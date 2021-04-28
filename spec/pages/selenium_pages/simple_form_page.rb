class SimpleFormPage < SitePrism::Page
  # single input field
  element :single_input_field, ".form-control[id='user-message']"
  element :single_field_message_btn, '#get-input > button'
  element :message_from_single_field, '#display'

  # two input field
  element :first_field_from_two_fields, '#sum1'
  element :second_field_from_two_fields, '#sum2'
  element :two_fields_message_btn, '#gettotal > button'
  element :message_from_two_fields, '#displayvalue'

  # sigle input field
  def fill_single_field(option)
    single_input_field.set(option)
    single_field_message_btn.click
  end

  def get_message_from_single_field
    message_from_single_field.text
  end

  # two input fields
  def fill_multiple_field(value1, value2)
    first_field_from_two_fields.set(value1)
    second_field_from_two_fields.set(value2)
    two_fields_message_btn.click
  end

  def get_message_from_two_fields
    message_from_two_fields.text
  end
end
