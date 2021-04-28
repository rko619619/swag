class JqueryFormPage < SitePrism::Page
  # single dropdown with search field
  element :single_dropdown_box_with_search_field, "[aria-labelledby='select2-country-container']"
  element :search_field_in_single_dropdown, :xpath, "//span/input[@class='select2-search__field']"
  element :search_result_from_single_dropdown, '.select2-results__option--highlighted'
  element :no_result_field_single_dropdown, '.select2-results__option'

  # multi dropdown with search field
  element :multi_dropdown_box_with_search_field, '.select2-search__field'
  element :search_result_from_multi_dropdown, '.select2-results__options'

  # dropdown box with disabled values
  element :dropdown_box_with_disabled_value, ".select2-selection__rendered:not([title=''])[id]"
  element :search_field_in_dropdown_box_with_disbled_value, :xpath, "//span/input[@class='select2-search__field']"
  element :search_result_from_dropdown_with_disabled_value, '.select2-results__options'

  # single dropdown with search field
  def click_on_single_dropdown_box
    single_dropdown_box_with_search_field.click
  end

  def seacrh_value_on_single_dropdown_box(search_value)
    search_field_in_single_dropdown.set(search_value).click
  end

  def click_on_search_result_single_dropdown
    search_result_from_single_dropdown.click
  end

  def get_select_value_from_single_dropdown_box
    single_dropdown_box_with_search_field.text
  end

  def present_no_result_from_single_dropdown_box
    no_result_field_single_dropdown.text
  end

  # multi dropdown with search field
  def click_on_multi_dropdown_box
    multi_dropdown_box_with_search_field.click
  end

  def seacrh_value_on_multi_dropdown_box(search_value)
    multi_dropdown_box_with_search_field.set(search_value)
  end

  def click_on_search_result_multi_dropdown
    search_result_from_multi_dropdown.click
  end

  def get_multi_dropdown_values(search_value)
    page.has_css?(".select2-selection__choice[title=#{search_value}]")
  end

  # dropdown box with disabled values
  def click_on_dropdown_box_with_disabled_value
    dropdown_box_with_disabled_value.click
  end

  def seacrh_value_on_dropdown_box_with_disbled_value(option)
    search_field_in_dropdown_box_with_disbled_value.set(option)
  end

  def click_on_search_result_of_dropdown_with_disabled_value
    search_result_from_dropdown_with_disabled_value.click
  end

  def get_select_value_from_dropdown_box_with_disabled_value
    dropdown_box_with_disabled_value.text
  end
end
