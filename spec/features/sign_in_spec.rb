feature 'Sign in' do
  let(:login_page) { LoginPage.new }

  it 'user is able to log in with a valid email and password' do
    login_page.login(VALID_NAME, VALID_PASSWORD)
    expect(current_url) == PRODUCTS_PAGE
  end

  it 'user is not able to log in with an invalid email and password' do
    login_page.login(INVALID_NAME, INVALID_PASSWORD)
    expect(login_page.get_error_message_on_login).to eq(ERROR_MESSAGE)
  end

  it 'user is not able to log in with a empty email and empty password' do
    login_page.login('', '')
    expect(login_page.get_error_message_on_login).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'user is not able to log in with a empty username and not empty password' do
    login_page.login('', 'INVALID_PASSWORD')
    expect(login_page.get_error_message_on_login).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'user is not able to log in with a not empty username and empty password' do
    login_page.login(INVALID_NAME, '')
    expect(login_page.get_error_message_on_login).to eq(ERROR_MESSAGE_PASSWORD)
  end

  it 'locked out user is not able to log in with a valid username and password' do
    login_page.login(LOCKED_OUT_USER_NAME, VALID_PASSWORD)
    expect(login_page.get_error_message_on_login).to eq(ERROR_MESSAGE_FOR_LOCKED_USER)
  end

  it 'user is not able to visit without login' do
    visit(PRODUCTS_PAGE)
    expect(login_page.get_error_message_on_login).to eq(DENIED_ACCESS)
  end
end
