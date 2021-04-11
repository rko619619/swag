feature 'Visit' do
  let(:login_page) { Login.new }
  let(:main_page) { Visit.new }
  before { visit URL }

  it 'transfer to twitter is able, when user click to icon Twiter' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    new_window = window_opened_by { main_page.twitter.click }
    within_window new_window do
      expect(page).to have_current_path(TWITTER_URL)
    end
  end

  it 'transfer to facebook is able, when user click to icon Facebook' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    new_window = window_opened_by { main_page.facebook.click }
    within_window new_window do
      expect(page).to have_current_path(FACEBOOK_URL)
    end
  end

  xit 'transfer to linkedin is able, when user click to icon Linkedin' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    new_window = window_opened_by { main_page.linkedin.click }
    within_window new_window do
      expect(page).to have_current_path(LINKEDIN_URL)
    end
  end

  it 'transfer to about page, when user click "ABOUT"' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    main_page.menu_button.click
    main_page.about.click
    expect(page).to have_current_path(ABOUT_URL)
  end
end
