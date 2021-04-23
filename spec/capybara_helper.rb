def checkbox_options(option)
  if option == 'check'
    [OPTION1, OPTION2, OPTION3, OPTION4].each do |option|
      expect(checkbox_form).to have_checked_field(option)
    end
  elsif option == 'uncheck'
    [OPTION1, OPTION2, OPTION3, OPTION4].each do |option|
      expect(checkbox_form).to have_unchecked_field(option)
    end
  end
end
