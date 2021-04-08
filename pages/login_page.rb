require './pages/login_page.rb'
require './test_data/sign_in.rb'

class Login < SitePrism::Page
  set_url URL

  element :user_name, '#user-name'
  element :user_password, '#password'
  element :click_button, '#login-button'
  element :error_message, '#login_button_container > div > form > div.error-message-container.error > h3'
end
