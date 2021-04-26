class DropdownFormPage < SitePrism::Page
  element :single_dropdown_list, '.from-control'
  elements :single_options_list, :xpath, '//select[@id="select-demo"]/*'
  element :single_selected_value, '.selected-value'
  element :multi_dropdown_list, '#multi-select'
  elements :multi_options_list, :xpath, '//select[@id="multi-select"]/*'
  element :first_btn, '#printMe'
  element :multi_selected_values, '.getall-selected'
  element :all_btn, '#printAll'

  def click_all_btn
    all_btn.click
  end

  def get_multi_all_values(option)
    %(Options selected are : #{option.value})
  end

  def get_multi_values(option)
    %(First selected option is : #{option.value})
  end

  def get_selected_multi_values
    multi_selected_values.text
  end

  def get_single_values(option)
    if option.value != ''
      %(Day selected :- #{option.value})
    else
      ''
    end
  end

  def choose_option(option)
    option.select_option
  end

  def get_selected_values
    single_selected_value(visible: false).text
  end

  def click_first_btn
    first_btn.click
  end
end
