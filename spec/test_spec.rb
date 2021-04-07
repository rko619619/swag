describe 'Visit the Webpage' do
  it 'view the main page' do
    visit('https://www.saucedemo.com/')
    expect(page).to have_field('Username')
  end

  it 'view the loging with wrong credentials' do
    visit('https://www.saucedemo.com')
    fill_in 'Username', with: 'Name'
    fill_in 'Password', with: 'Password'
    click_button 'Login'
    expect(page).to have_selector(:xpath, '//*[@id="login_button_container"]/div/form/div[3]')
  end

  it 'view the loging with correct credentials' do
    visit('https://www.saucedemo.com')
    fill_in 'Username', with: 'standard_user'
    fill_in 'Password', with: 'secret_sauce'
    click_button 'Login'
    expect(page).to have_content('PRODUCTS')
  end



end
