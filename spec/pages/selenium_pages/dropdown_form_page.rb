class DropdownFormPage < SitePrism::Page
  element :single_selected_value, '.selected-value'
  element :multi_dropdown_list, 'select#multi-select'
  elements :multi_options_list, :xpath, '//select[@id="multi-select"]/*'
  element :first_btn, '#printMe'
  element :multi_selected_values, '.getall-selected'
  element :all_btn, '#printAll'

  def select_single_form(option_value)
    select_definite('select#select-demo', option_value)
  end

  def select_multi_form(option_value)
    select_definite(multi_dropdown_list, option_value)
  end

  def get_selected_values
    single_selected_value(visible: false).text
  end

  def get_single_values(option)
    %(Day selected :- #{option})
  end



  def click_all_btn
    all_btn.click
  end

  def get_multi_all_values(option)
    %(Options selected are : #{option.value})
  end

  def get_multi_values(option)
    %(First selected option is : #{option})
  end

  def get_selected_multi_values
    multi_selected_values.text
  end

  def click_first_btn
    first_btn.click
  end
end
