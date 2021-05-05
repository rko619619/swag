class CheckboxFormPage < SitePrism::Page
  # single checkbox
  element :single_checkbox, '#isAgeSelected'
  element :message_from_single_checkbox, '#txtAge'

  # multiple checkbox
  element :multiple_checkbox_body, :xpath, "//*[@id='easycont']/div/div[2]/div[2]"
  element :multiple_checkbox, '#check1'

  # single checkbox
  def click_single_checkbox
    single_checkbox.click
  end

  def get_message_from_single_checkbox
    message_from_single_checkbox.text
  end

  # multiple checkbox
  def click_multiple_checkbox
    multiple_checkbox.click
  end

  def status_of_select_option?(option, action)
    get_status_of_checkbox(multiple_checkbox_body, option, action)
  end
end
