class AjaxFormPage < SitePrism::Page
  # ajax form
  elements :fields_in_ajax_form, '.form-control'
  element :submit_button, '[name=btn-submit]'
  element :loading_message, '#submit-control'

  def fill_ajax_form(option)
    fields_in_ajax_form.each do |field|
      field.set(option)
    end
  end

  def click_submit_button
    submit_button.click
  end

  def proccesing_message_is_get?
    loading_message.text == PROCCESING_MSG
  end

  def wait_success_message
    find(:xpath, "//div[contains(text(), '#{SUCCESS_MSG}')]", wait: 5)
  end
end
