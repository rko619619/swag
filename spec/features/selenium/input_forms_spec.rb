feature 'Input forms' do
  let(:simple_form)     { SimpleFormPage.new }
  let(:checkbox_form)   { CheckboxFormPage.new }
  let(:radio_buttons_form)   { RadioButtonsPage.new }

  context 'Simple Form', tag: 'smoke'do
    it 'user is able to enter message to single input field' do
      visit SIMPLE_FORM_DEMO

      simple_form.fill_single_filed
      expect(simple_form.get_message).to eq MESSAGE_SINGLE_FIELD
    end

    it 'user is able to enter message to two input fields' do
      visit SIMPLE_FORM_DEMO

      simple_form.fill_multiple_field(1,2)
      expect(simple_form.get_total).to eq '3'
    end
  end

  context 'Checkbox', tag: 'smoke' do
    it 'user is able to click single checkbox' do
      visit CHECKBOX_DEMO

      checkbox_form.click_single_checkbox
      expect(checkbox_form.get_message).to eq MESSAGE_CHECKBOX_FIELD
    end

    it 'user is able to click multiple checkbox' do
      visit CHECKBOX_DEMO

      checkbox_form.click_multiple_checkbox
      checkbox_options('check')
      expect(checkbox_form.get_checkbox_text).to eq UNCHECK_ALL

      checkbox_form.click_multiple_checkbox
      checkbox_options('uncheck')
      expect(checkbox_form.get_checkbox_text).to eq CHECK_ALL
    end
  end

  context 'Radio buttons', tag: 'smoke' do
    it 'user is able to click on button to get the selected value' do
      visit RADIO_BUTTONS_DEMO
      (radio_buttons_form.gender_radio_btn).each do |radio_btn|
        radio_buttons_form.click_radio_btn(radio_btn)
        radio_buttons_form.click_message_btn
        expect(page).to have_content(radio_buttons_form.get_message_radio(radio_btn))
      end
    end

    it 'user is able to click on button to get the selected values from Group Sex and Age group' do
      visit RADIO_BUTTONS_DEMO
      (radio_buttons_form.genders_radio_btn).each do |gender_radio_btn|
        (radio_buttons_form.age_radio_btn).each do |age_radio_btn|
          radio_buttons_form.click_group_radio_btn(gender_radio_btn, age_radio_btn)
          radio_buttons_form.get_values
          expect(radio_buttons_form.values_total).to eq(radio_buttons_form.get_values_radio(gender_radio_btn, age_radio_btn))
        end
      end
    end
  end
end


