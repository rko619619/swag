class ProductsPage < SitePrism::Page
  element :about, :xpath, '//*[@id="about_sidebar_link"]'
  element :menu_button, :css, '#react-burger-menu-btn'

  def social_media(social_media)
    window_opened_by { page.find(".social_#{social_media}").click }
  end

  def menu_button_click
    menu_button.click
    about.click
  end
end
