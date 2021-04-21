feature 'Simple Form' do
  let(:simple_form)   { SimpleFormPage.new }

  before { simple_form.visit_page }

  it 'user is able to enter message to single input field', tag: 'smoke' do
    simple_form.enter_message
    expect(simple_form.get_message).to eq MESSAGE_SINGLE_FIELD
  end

  it 'user is able to enter message to two input fields', tag: 'smoke' do
    simple_form.enter_messages
    expect(simple_form.get_total).to eq TOTAL_FIELD
  end
end

feature 'Checkbox Demo' do
  let(:checkbox_form) { CheckboxFormPage.new }

  before { checkbox_form.visit_page }

  it 'user is able to click single checkbox', tag: 'smoke' do
    checkbox_form.click_single_checkbox
    expect(checkbox_form.get_message).to eq MESSAGE_CHECKBOX_FIELD
  end

  it 'user is able to click multiple checkbox', tag: 'smoke' do
    checkbox_form.click_multiple_checkbox
    [OPTION1, OPTION2, OPTION3, OPTION4].each do |option|
      expect(checkbox_form).to have_checked_field(option)
    end
    expect(checkbox_form.get_checkbox_text).to eq UNCHECK_ALL

    checkbox_form.click_multiple_checkbox
    [OPTION1, OPTION4, OPTION4, OPTION4].each do |option|
      expect(checkbox_form).to have_unchecked_field(option)
    end
    expect(checkbox_form.get_checkbox_text).to eq CHECK_ALL
  end
end

