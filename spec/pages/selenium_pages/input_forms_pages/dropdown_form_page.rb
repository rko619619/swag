class DropdownFormPage < SitePrism::Page
  # select list
  element :selected_value_of_select_list, '.selected-value'

  # select list
  def select_value_in_select_list(option)
    select_definite('select#select-demo', option)
  end

  def correct_value_of_select_list_is_get?(option)
    selected_value_of_select_list(visible: false).text == %(Day selected :- #{option})
  end
end
