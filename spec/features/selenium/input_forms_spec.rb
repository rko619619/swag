feature 'Input forms' do
  let(:simple_form)          { SimpleFormPage.new   }
  let(:checkbox_form)        { CheckboxFormPage.new }
  let(:radio_buttons_form)   { RadioButtonsPage.new }
  let(:dropdown_form)        { DropdownFormPage.new }
  let(:input_form)           { InputFormPage.new    }
  let(:ajax_form)            { AjaxFormPage.new     }

  context 'Simple Form', tag: 'smoke' do
    before { visit SIMPLE_FORM_DEMO }

    it 'user is able to enter message to single input field' do
      simple_form.fill_single_filed
      expect(simple_form.get_message).to eq MESSAGE_SINGLE_FIELD
    end

    it 'user is able to enter message to two input fields' do
      value_a = rand(50)
      value_b = rand(50)
      sum = value_a + value_b
      simple_form.fill_multiple_field(value_a, value_b)
      expect(simple_form.get_total).to eq sum.to_s
    end
  end

  context 'Checkbox', tag: 'smoke' do
    before { visit CHECKBOX_DEMO }

    it 'user is able to click single checkbox' do
      checkbox_form.click_single_checkbox
      expect(checkbox_form.get_message).to eq MESSAGE_CHECKBOX_FIELD
    end

    it 'user is able to click multiple checkbox' do
      checkbox_form.click_multiple_checkbox
      checkbox_form.checkbox_options('check').each do |value|
        expect(value).to eq true
      end
      expect(checkbox_form.get_checkbox_text).to eq UNCHECK_ALL

      checkbox_form.click_multiple_checkbox
      checkbox_form.checkbox_options('uncheck').each do |value|
        expect(value).to eq true
      end

      expect(checkbox_form.get_checkbox_text).to eq CHECK_ALL
    end
  end

  context 'Radio buttons', tag: 'smoke' do
    before { visit RADIO_BUTTONS_DEMO }

    it 'user is able to click on single radio button and get the selected value' do
      radio_buttons_form.single_radio_btn.each do |radio_btn|
        radio_buttons_form.click_radio_btn(radio_btn)
        radio_buttons_form.click_message_btn
        expect(page).to have_content(radio_buttons_form.get_message_radio(radio_btn))
      end
    end

    it 'user is able to click on group radio button and get the selected values from Group Sex and Age group' do
      radio_buttons_form.gender_radio_btn.each do |gender_radio_btn|
        radio_buttons_form.age_radio_btn.each do |age_radio_btn|
          radio_buttons_form.click_group_radio_btn(gender_radio_btn, age_radio_btn)
          radio_buttons_form.get_values
          expect(radio_buttons_form.get_values_radio(gender_radio_btn, age_radio_btn)).to eq(radio_buttons_form.values_total)
        end
      end
    end
  end

  context 'Select list', tag: 'smoke' do
    before { visit SELECT_DROPDOWN_DEMO }
    DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    STATES = ['California','Florida', 'New Jersey', 'New York', 'Ohio', 'Texas', 'Pennsylvania', 'Washington']

    it 'user is able to select value from the list' do
      dropdown_form.select_single_form(DAYS[1])
      expect(dropdown_form.get_selected_values).to eq dropdown_form.get_single_values(DAYS[1])
    end

    it "user is able to click on 'First selected' button and get value from the list" do
      dropdown_form.select_multi_form(STATES[0])
      dropdown_form.select_multi_form(STATES[2])
      dropdown_form.select_multi_form(STATES[4])
      dropdown_form.click_first_btn
      expect(dropdown_form.get_selected_multi_values).to eq dropdown_form.get_multi_values(STATES[0])
    end
  end

  context 'Input form with validations', tag: 'smoke' do
    before { visit INPUT_FORM_SUBMIT }

    it 'user is not able to send form, with empty value' do
      input_form.click_send_btn
      expect(input_form.get_messages).to eq EMPTY_LIST
    end

    it 'user is not able to send form, with unvalid value' do
      input_form.fill_form_unvalid
      expect(input_form.get_messages).to eq INVALID_LIST
    end

    it 'user is able to send form, with valid value ' do
      input_form.fill_form_valid
      input_form.click_send_btn
      expect(input_form.get_messages).to eq []
    end
  end

  context 'Ajax Form Submit with Loading icon ', tag: 'smoke' do
    before { visit AJAX_FORM_SUBMIT }

    it 'user is able to fill ajax form' do
      ajax_form.fill_form
      ajax_form.click_submit_btn
      expect(ajax_form.get_proccesing_msg).to eq PROCCESING_MSG
      expect(ajax_form.get_proccesing_wait_msg).to eq SUCCESS_MSG
    end
  end

  context 'Jquery select dropdown', tag: 'smoke' do
    before { visit AJAX_FORM_SUBMIT }

    it 'user is able to fill ajax form' do
      ajax_form.fill_form
      ajax_form.click_submit_btn
      expect(ajax_form.get_proccesing_msg).to eq PROCCESING_MSG
      sleep(4)
      expect(ajax_form.get_proccesing_msg).to eq SUCCESS_MSG
    end
  end

end
