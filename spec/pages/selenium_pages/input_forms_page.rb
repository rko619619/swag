class SimpleFormPage < SitePrism::Page
  element :single_input_field, ".form-control[id='user-message']"
  element :first_input_field, "#sum1"
  element :second_input_field, "#sum2"
  element :get_total_btn, '#gettotal > button'
  element :show_message_btn, '#get-input > button'
  element :message, '#display'
  element :total, '#displayvalue'

  def visit_page
    visit SIMPLE_FORM_DEMO
  end

  def enter_message
    single_input_field.set(MESSAGE_SINGLE_FIELD)
    show_message_btn.click
  end

  def enter_messages
    first_input_field.set(TOTAL_FIRST_FIELD)
    second_input_field.set(TOTAL_SECOND_FIELD)
    get_total_btn.click
  end

  def get_message
    message.text
  end

  def get_total
    total.text
  end
end

class CheckboxFormPage < SitePrism::Page
  element :single_checkbox, '#isAgeSelected'
  element :multiple_checkbox, '#check1'
  element :message_form, '#txtAge'

  def visit_page
    visit CHECKBOX_DEMO
  end

  def click_single_checkbox
    single_checkbox.click
  end

  def click_multiple_checkbox
    multiple_checkbox.click
  end

  def get_message
    message_form.text
  end

  def get_checkbox_text
    multiple_checkbox.value
  end

  def check_checkbox
    [checked?('Option 1'), checked?('Option 2'), check?('Option 3'), check?('Option 4')]
  end
end
