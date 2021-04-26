def interact_with_checkbox(option, *args)
  empty_list =[]
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
