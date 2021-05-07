class TablePaginationPage < SitePrism::Page
  # table pagination
  elements :total_records_from_page, :xpath, '//*[@id="myTable"]/tr/td[1]', visible: false
  element :next_page_button, '.next_link'
  element :prev_page_button, '.page_link.active'

  # table pagination
  def get_count_of_records_from_table
    total_records_from_page.length
  end

  def click_on_next_button
    next_page_button.click
  end

  def check_that_value_on_page?
    has_xpath?("//*[@id='myTable']/tr[1]/td[contains(., '1')]")
  end

  def page_has_buttons_for_navigate?
    has_css?('.next_link') || has_css?('.prev_link')
  end

  def click_on_prev_button
    prev_page_button.click
  end
end
