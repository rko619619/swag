def get_status_of_checkbox(checkbox_id, dropbox_value, action)
  if action == 'check'
    checkbox_id.has_checked_field?(dropbox_value)
  elsif action == 'uncheck'
    checkbox_id.has_unchecked_field?(dropbox_value)
  end
end

def select_definite(select_id, option_value)
  find(select_id).find("option[value='#{option_value}']").select_option
end

def check_value_in_table_tasks(elements, filter_value)
  check = true
  elements.each do |element|
    if not element.text == filter_value
      check = false
    end
  end
  check
end
