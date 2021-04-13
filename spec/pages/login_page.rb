class LoginPage < SitePrism::Page
  element :user_name, '#user-name'
  element :user_password, '#password'
  element :click_button, '#login-button'
  element :error_message, '.error-message-container.error'
  element :error_button, '.error-button'

  def login(username, password)
    visit LOGIN_PAGE
    user_name.set(username)
    user_password.set(password)
    click_button.click
  end

  def get_error_message_on_login
    error_message.text
  end
end
