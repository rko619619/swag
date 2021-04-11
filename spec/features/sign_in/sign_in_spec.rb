feature 'Sign in' do
  let(:login_page) { Login.new }
  before { visit URL }

  it 'standart_user is not able to log in with an invalid email and password' do
    login_page.fill_login_form(INVALID_NAME, INVALID_PASSWORD)
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE)
  end

  it 'standart_user is valid to log in with a valid email and password' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)
    expect(page).to have_current_path(MAIN_URL)
  end

  it 'standart_user is not able to log in with a empty email and empty password' do
    login_page.fill_login_form('', '')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'standart_user is not able to log in with a empty username and not empty password' do
    login_page.fill_login_form('', 'INVALID_PASSWORD')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'standart_user is not able to log in with a not empty username and empty password' do
    login_page.fill_login_form(INVALID_NAME, '')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_PASSWORD)
  end

  it 'locked_out_user is not able to log in with a valid username and password' do
    login_page.fill_login_form(LOCKED_OUT_USER_NAME, VALID_PASSWORD)
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_FOR_LOCKED_USER)
  end

  it 'standart_user is not able to visit without login' do
    visit(MAIN_URL)
    expect(login_page.error_message.text).to eq(DENIED_ACCESS)
  end

  it 'error handling is closed when we click on the cross' do
    login_page.fill_login_form(INVALID_NAME, '')
    login_page.error_button.click
    expect(page).not_to have_content(ERROR_MESSAGE_PASSWORD)
  end
end
