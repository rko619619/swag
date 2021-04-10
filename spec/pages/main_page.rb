class Visit < SitePrism::Page
  element :linkedin, '.social_linkedin'
  element :facebook, '.social_facebook'
  element :twitter, '.social_twitter'
  element :about, :xpath, '//*[@id="about_sidebar_link"]'
  element :menu_button, '#react-burger-menu-btn'
end

