feature 'Social media' do
  let(:login_page)     { LoginPage.new }
  let(:products_page)  { ProductsPage.new }
  before { visit LOGIN_PAGE }
  before { login_page.fill_login_form(VALID_NAME, VALID_PASSWORD) }

  it 'transfer to twitter is able, when user click to icon Twiter' do
    new_window = products_page.social_media('twitter')
    within_window new_window do
      expect(page).to have_current_path(TWITTER_URL)
    end
  end

  it 'transfer to facebook is able, when user click to icon Facebook' do
    new_window = products_page.social_media('facebook')
    within_window new_window do
      expect(page).to have_current_path(FACEBOOK_URL)
    end
  end

  xit 'transfer to linkedin is able, when user click to icon Linkedin' do
    new_window = products_page.social_media('linkedin')
    within_window new_window do
      expect(page).to have_current_path(LINKEDIN_URL)
    end
  end

  it 'transfer to about page, when user click button "ABOUT"' do
    products_page.menu_button_click
    expect(page).to have_current_path(ABOUT_URL)
  end
end
