feature 'Sign in' do
  let(:login_page) { LoginPage.new }

  it 'user is able to log in with valid email and password', tag: 'smoke' do
    login_page.login(VALID_NAME, VALID_PASSWORD)
    expect(current_url).to eq '1'
  end

  it 'user is not able to log in with invalid email and password', tag: 'smoke' do
    login_page.login(INVALID_NAME, INVALID_PASSWORD)
    expect(login_page.get_error_message_on_login).to eq ERROR
  end

  it 'user is not able to log in with empty email and empty password', tag: 'regression' do
    login_page.login('', '')
    expect(login_page.get_error_message_on_login).to eq ERROR_USERNAME
  end

  it 'user is not able to log in with empty username and not empty password', tag: 'regression' do
    login_page.login('', 'INVALID_PASSWORD')
    expect(login_page.get_error_message_on_login).to eq ERROR_USERNAME
  end

  it 'user is not able to log in with not empty username and empty password', tag: 'regression' do
    login_page.login(INVALID_NAME, '')
    expect(login_page.get_error_message_on_login).to eq ERROR_PASSWORD
  end

  it 'locked out user is not able to log in with valid username and password', tag: 'regression' do
    login_page.login(LOCKED_OUT_USER_NAME, VALID_PASSWORD)
    expect(login_page.get_error_message_on_login).to eq ERROR_FOR_LOCKED_USER
  end

  it 'user is not allowed to visit other pages without autorization', tag: 'regression' do
    visit(PRODUCTS_PAGE)
    expect(login_page.get_error_message_on_login).to eq DENIED_ACCESS
  end
end
