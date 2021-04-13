feature 'Social media' do
  let(:login_page)     { LoginPage.new }
  let(:products_page)  { ProductsPage.new }
  before { login_page.login(VALID_NAME, VALID_PASSWORD) }

  it 'user is able to visit socials media from media icons' do
    media = { 'twitter' => TWITTER_URL,
              'facebook' => FACEBOOK_URL,
              'linkedin' => LINKEDIN_URL }
    media.each do |key, value|
      new_window = products_page.social_media(key)
      within_window new_window do
        expect(current_url) == value
      end
    end
  end

  it 'transfer to about page, when user click button "ABOUT"' do
    products_page.click_on_about_btn
    expect(current_url) == ABOUT_URL
  end
end
