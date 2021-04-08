require './pages/login_page.rb'
require './test_data/sign_in.rb'

feature 'Sing in' do
  subject { Login.new }
  it 'with an invalid email and password' do
    visit(URL)
    subject.user_name.set(INVALID_NAME)
    subject.user_password.set(INVALID_PASSWORD)
    subject.click_button.click
    expect(subject.error_message.text).to eq(ERROR_MESSAGE)
  end

  it 'with a valid email and password' do
    visit(URL)
    subject.user_name.set(VALID_NAME)
    subject.user_password.set(VALID_PASSWORD)
    subject.click_button.click
    expect(page).to have_current_path(MAIN_URL)
  end

  it 'with a empty email and empty password' do
    visit(URL)
    subject.user_name.set('')
    subject.user_password.set('')
    subject.click_button.click
    expect(subject.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'with a empty username and not empty password' do
    visit(URL)
    subject.user_name.set('')
    subject.user_password.set(INVALID_PASSWORD)
    subject.click_button.click
    expect(subject.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'with a not empty username and empty password' do
    visit(URL)
    subject.user_name.set(INVALID_NAME)
    subject.user_password.set('')
    subject.click_button.click
    expect(subject.error_message.text).to eq('Epic sadface: Password is required')
  end
end
