class AjaxFormPage < SitePrism::Page
  elements :mutli_form, '.form-control'
  element :submit_btn, '[name=btn-submit]'
  element :loading_msg, '#submit-control'

  def click_submit_btn
    submit_btn.click
  end

  def fill_form
    mutli_form.each do |form|
      form.set(VALID_FIRST_NAME)
    end
  end

  def get_proccesing_msg
    loading_msg.text
  end
end
