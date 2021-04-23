class RadioButtonsPage < SitePrism::Page
  elements :single_radio_btn, '[name=optradio]'
  elements :gender_radio_btn, '[name=gender]'
  elements :age_radio_btn, '[name=ageGroup]'
  element :checked_value, '.radiobutton'
  element :get_checked_btn, '#buttoncheck'
  element :get_values_btn, :xpath, "//button[contains(., 'Get values')]"
  element :values, '.groupradiobutton'

  def click_radio_btn(gender)
    gender.click
  end

  def click_group_radio_btn(gender, age)
    gender.click
    age.click
  end

  def get_message_radio(btn)
    %(Radio button '#{btn.value}' is checked)
  end

  def get_messages_radio
    checked_value.text
  end

  def click_message_btn
    get_checked_btn.click
  end

  def get_values
    get_values_btn.click
  end

  def get_values_radio(gender, age)
    %(Sex : #{gender.value}\nAge group: #{age.value})
  end

  def values_total
    values.text
  end
end
