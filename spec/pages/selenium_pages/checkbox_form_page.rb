class CheckboxFormPage < SitePrism::Page
  element :single_checkbox, '#isAgeSelected'
  element :multiple_checkbox, '#check1'
  element :message_form, '#txtAge'

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
end
