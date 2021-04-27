def interact_with_checkbox(checkbox_id,dropbox_value, action)
  if action == 'check'
    checkbox_id.has_checked_field?(dropbox_value)
  elsif action == 'uncheck'
    checkbox_id.has_unchecked_field?(dropbox_value)
  end
end

def select_definite(select_id, option_value)
  select_id.find("option[value='#{option_value}']").select_option
end