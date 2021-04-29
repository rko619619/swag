class RadioButtonsPage < SitePrism::Page
  # radio button
  element :checked_btn_of_radio_buttons, '#buttoncheck'
  element :message_of_radio_buttons, 'p.radiobutton'

  # group radio buttons
  element :values_button_of_group_buttons, :xpath, "//button[contains(., 'Get values')]"
  element :message_of_group_radio_buttons, 'p.groupradiobutton'

  # radio button
  def click_radio_button(gender)
    page.find("[name=optradio][value='#{gender}']").click
  end

  def click_on_get_checked_button
    checked_btn_of_radio_buttons.click
  end

  def get_correct_message_of_radio_buttons?(_option)
    message_of_radio_buttons.text == %(Radio button '#{SEX[0]}' is checked)
  end

  # group radio buttons
  def click_on_group_radio_buttons(gender, age)
    page.find("[name=gender][value='#{gender}']").click
    page.find("[name=ageGroup][value='#{age}']").click
  end

  def click_on_get_value_button
    values_button_of_group_buttons.click
  end

  def correct_message_of_group_radio_buttons_is_get?(gender, age)
    message_of_group_radio_buttons.text == %(Sex : #{gender}\nAge group: #{age})
  end
end
