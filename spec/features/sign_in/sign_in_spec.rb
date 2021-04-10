feature 'Sing in' do
  let(:login_page) { Login.new }

  it 'user is not able to log in with an invalid email and password' do
    visit(URL)
    login_page.fill_login_form(INVALID_NAME, INVALID_PASSWORD)
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE)
  end

  it 'user is valid to log in with a valid email and password' do
    visit(URL)
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)
    expect(page).to have_current_path(MAIN_URL)
  end

  it 'user is not able to log in with a empty email and empty password' do
    visit(URL)
    login_page.fill_login_form('', '')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'user is not able to log in with a empty username and not empty password' do
    visit(URL)
    login_page.fill_login_form('', 'INVALID_PASSWORD')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_USERNAME)
  end

  it 'user is not able to log in with a not empty username and empty password' do
    visit(URL)
    login_page.fill_login_form(INVALID_NAME, '')
    expect(login_page.error_message.text).to eq(ERROR_MESSAGE_PASSWORD)
  end

  let(:login_page) { Login.new }

  it 'user is not able to visit without login' do
    visit(MAIN_URL)
    expect(login_page.error_message.text).to eq(DENIED_ACCESS)
  end


  let(:login_page) { Login.new }

  it 'error handling is closed when we click on the cross' do
    visit(URL)
    login_page.fill_login_form(INVALID_NAME, '')
    login_page.error_button.click
    expect(page).not_to have_content(ERROR_MESSAGE_PASSWORD)
  end
end
