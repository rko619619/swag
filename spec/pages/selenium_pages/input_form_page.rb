class InputFormPage < SitePrism::Page
  element :send_btn, '.btn-default'
  elements :empty_error_message, ".help-block[data-bv-validator='notEmpty']"
  elements :empty_error_message, ".help-block[data-bv-result='INVALID']"
  elements :input_forms, '.form-control'
  element :first_name_form, '[name=first_name]'
  element :last_name_form, '[name=last_name]'
  element :email_form, '[name=email]'
  element :phone_form, '[name=phone]'
  element :address_form, '[name=address]'
  element :city_form, '[name=city]'
  element :state_select_form, '[name=state]'
  element :zip_code_form, '[name=zip]'
  element :comment_form, '[name=comment]'

  def fill_form_valid
    first_name_form.set(VALID_FIRST_NAME)
    last_name_form.set(VALID_LAST_NAME)
    email_form.set(VALID_EMAIL)
    phone_form.set(VALID_PHONE)
    address_form.set(VALID_ADDRESS)
    city_form.set(VALID_CITY)
    zip_code_form.set(VALID_ZIP_CODE)
    comment_form.set(VALID_DESCRIPTION)
    state_select_form.select(VALID_STATE)
  end

  def fill_form_unvalid
    input_forms.each do |form|
      form.set(INVALID_VALUE)
    end
  end

  def get_messages
    empty_list = []
    empty_error_message.each do |message|
      empty_list << message.text
    end
    empty_list
  end

  def click_send_btn
    send_btn.click
  end
end
