class CheckboxFormPage < SitePrism::Page
  element :checkbox_body, :xpath, "//*[@id='easycont']/div/div[2]/div[2]"
  element :single_checkbox, '#isAgeSelected'
  element :multiple_checkbox, '#check1'
  element :message_form, '#txtAge'

  def checkbox_options(option, action)
    get_status_of_checkbox(checkbox_body, option, action)
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
end
