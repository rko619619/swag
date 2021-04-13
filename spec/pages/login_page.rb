class LoginPage < SitePrism::Page
  element :user_name, '#user-name'
  element :user_password, '#password'
  element :click_button, '#login-button'
  element :error_message, '.error-message-container.error'
  element :error_button, '.error-button'

  def fill_login_form(username, password)
    user_name.set(username)
    user_password.set(password)
    click_button.click
  end
end
