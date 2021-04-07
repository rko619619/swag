describe 'Visit the Webpage' do
  it 'view the index page' do
    visit('https://www.saucedemo.com/')
    expect(page).to have_content('Accepted usernames are:')
  end
end
