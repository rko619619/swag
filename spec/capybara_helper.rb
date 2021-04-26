def interact_with_checkbox(option, *args)
  empty_list = []
  if option == 'check'
    args.each do |option|
      empty_list << page.has_checked_field?(option)
    end
  elsif option == 'uncheck'
    args.each do |option|
      empty_list << page.has_unchecked_field?(option)
    end
  end
  empty_list
end

def select_definite(select_id, option_value)
  select_id.find("option[value='#{option_value}']").select_option
end