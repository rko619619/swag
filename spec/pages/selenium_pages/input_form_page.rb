class InputFormPage < SitePrism::Page
  # input form
  element :send_button, '.btn-default'
  elements :messages_from_input_from, ".help-block[data-bv-result='INVALID']"
  elements :input_form_fields, '.form-control'
  element :first_name_field, '[name=first_name]'
  element :last_name_field, '[name=last_name]'
  element :email_field, '[name=email]'
  element :phone_field, '[name=phone]'
  element :address_field, '[name=address]'
  element :city_field, '[name=city]'
  element :state_select_field, '[name=state]'
  element :zip_code_field, '[name=zip]'
  element :comment_field, '[name=comment]'

  # input form
  def click_send_button
    send_button.click
  end

  def get_messages_from_input_form
    empty_list = []
    messages_from_input_from.each do |message|
      empty_list << message.text
    end
    empty_list
  end

  def fill_form_with_invalid_values(option)
    input_form_fields.each do |field|
      field.set(option)
    end
  end

  def fill_form_with_valid_values
    first_name_field.set(Faker::Name.first_name)
    last_name_field.set(Faker::Name.last_name)
    email_field.set(Faker::Internet.email)
    phone_field.set(Faker::PhoneNumber.cell_phone)
    address_field.set(Faker::Address.full_address)
    city_field.set(Faker::Address.city)
    zip_code_field.set(Faker::Address.zip_code)
    comment_field.set(Faker::Alphanumeric.alpha(number: 20))
    state_select_field.select(VALID_STATE)
  end
end
