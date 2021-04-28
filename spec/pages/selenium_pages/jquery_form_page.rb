class JqueryFormPage < SitePrism::Page
  # single dropdown with search field
  element :search_dropdown_box, "[aria-labelledby='select2-country-container']"
  element :search_field_in_search_dropdown, :xpath, "//span/input[@class='select2-search__field']"
  element :search_result_from_search_dropdown, '.select2-results__option--highlighted'
  element :no_result_in_search_dropdown, '.select2-results__option'

  # multi dropdown with search field
  element :multi_dropdown_box, '.select2-search__field'
  element :search_result_from_multi_dropdown, '.select2-results__options'

  # dropdown box with disabled values
  element :disabled_dropdown_box, ".select2-selection__rendered:not([title=''])[id]"
  element :search_field_in_disabled_dropdown, :xpath, "//span/input[@class='select2-search__field']"
  element :search_result_from_disabled_dropdown, '.select2-results__options'

  # single dropdown with search field
  def click_on_search_dropdown
    search_dropdown_box.click
  end

  def search_in_search_dropdown(search_value)
    search_field_in_search_dropdown.set(search_value).click
  end

  def click_on_search_result_in_search_dropdown
    search_result_from_search_dropdown.click
  end

  def get_select_value_from_search_dropdown
    search_dropdown_box.text
  end

  def present_no_result_from_search_dropdown
    no_result_in_search_dropdown.text
  end

  # multi dropdown with search field
  def search_on_multi_dropdown(search_value)
    multi_dropdown_box.set(search_value)
  end

  def click_on_search_result_multi_dropdown
    search_result_from_multi_dropdown.click
  end

  def element_is_present_in_multi_dropdown?(search_value)
    page.has_css?(".select2-selection__choice[title=#{search_value}]")
  end

  # dropdown box with disabled values
  def click_on_disabled_dropdown
    disabled_dropdown_box.click
  end

  def search_value_on_disabled_dropdown(option)
    search_field_in_disabled_dropdown.set(option)
  end

  def click_on_search_result_in_disabled_dropdown
    search_result_from_disabled_dropdown.click
  end

  def get_select_value_from_disabled_dropdown
    disabled_dropdown_box.text
  end
end
