class TablePaginationPage < SitePrism::Page
  # table pagination
  elements :total_records_from_page, :xpath, '//*[@id="myTable"]/tr/td[1]', visible: false
  element :records_for_check, :xpath, '//*[@id="myTable"]'
  element :next_page_button, '.next_link'
  element :prev_page_button, '.prev_link'
  element :table_from_page, '.content'

  # table pagination
  def collect_records_from_table
    total_records_from_page.length
  end

  def get_value_for_check
    records_for_check.text
  end

  def click_on_next_button
    next_page_button.click
  end

  def page_has_buttons_for_navigate?
    has_css?('.next_link') || has_css?('.prev_link')
  end

  def click_on_prev_button
    prev_page_button.click
  end
end
