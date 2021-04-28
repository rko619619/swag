feature 'Input forms' do
  let(:simple_form)          { SimpleFormPage.new   }
  let(:checkbox_form)        { CheckboxFormPage.new }
  let(:radio_buttons_form)   { RadioButtonsPage.new }
  let(:dropdown_form)        { DropdownFormPage.new }
  let(:input_form)           { InputFormPage.new    }
  let(:ajax_form)            { AjaxFormPage.new     }
  let(:jquery_form)          { JqueryFormPage.new   }

  context 'Simple Form', tag: 'smoke' do
    before { visit SIMPLE_FORM_DEMO }

    MESSAGE_SINGLE_FIELD = 'My message'.freeze

    it 'user is able to enter message to single input field' do
      simple_form.fill_single_field(MESSAGE_SINGLE_FIELD)
      expect(simple_form.get_message_from_single_field).to eq MESSAGE_SINGLE_FIELD
    end

    it 'user is able to enter message to two input fields' do
      first_value = rand(50)
      second_value = rand(50)
      sum = first_value + second_value
      simple_form.fill_multiple_field(first_value, second_value)
      expect(simple_form.get_message_from_two_fields).to eq sum.to_s
    end
  end

  context 'Checkbox', tag: 'smoke' do
    before { visit CHECKBOX_DEMO }

    OPTIONS = ['Option 1', 'Option 2', 'Option 3', 'Option 4'].freeze

    it 'user is able to click single checkbox' do
      checkbox_form.click_single_checkbox
      expect(checkbox_form.get_message_from_single_checkbox).to eq STATUS_OF_SINGLE_CHECKBOX
    end

    it 'user is able to click multiple checkbox' do
      checkbox_form.click_multiple_checkbox
      expect(checkbox_form.status_of_select_option?(OPTIONS[0], 'check')).to eq true

      checkbox_form.click_multiple_checkbox
      expect(checkbox_form.status_of_select_option?(OPTIONS[0], 'uncheck')).to eq true
    end
  end

  context 'Radio buttons', tag: 'smoke' do
    before { visit RADIO_BUTTONS_DEMO }

    SEX = %w[Male Female].freeze
    AGE = ['0 - 5', '5 - 15', '15 - 50'].freeze

    it 'user is able to click on single radio button and get the selected value' do
      radio_buttons_form.click_radio_button(SEX[0])
      radio_buttons_form.click_on_get_checked_button
      expect(radio_buttons_form.get_correct_message_of_radio_buttons?(SEX[0])).to eq true
    end

    it 'user is able to click on group radio button and get the selected values from Group Sex and Age group' do
      radio_buttons_form.click_on_group_radio_buttons(SEX[0], AGE[0])
      radio_buttons_form.click_on_get_value_button
      expect(radio_buttons_form.get_correct_message_of_group_radio_buttons?(SEX[0], AGE[0])).to eq true
    end
  end

  context 'Select list', tag: 'smoke' do
    before { visit SELECT_DROPDOWN_DEMO }
    DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze

    it 'user is able to select value from the list' do
      dropdown_form.select_single_form(DAYS[1])
      expect(dropdown_form.get_selected_values).to eq dropdown_form.get_single_values(DAYS[1])
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
    before { visit JQUERY_SELECT_DROPDOWN }

    VALUES_FOR_SINGLE_DROPDOWN_BOX = ['Denmark', 'Invalid value'].freeze
    VALUES_FOR_MULTI_DROPDOWN_BOX = %w[California Colorado].freeze
    VALUES_FOR_DROPDOWN_BOX_WITH_DISABLED_VALUES = ['Puerto Rico', 'Guam'].freeze

    it 'user is able to search and select value in single dropdown box' do
      jquery_form.click_on_search_dropdown
      jquery_form.search_in_search_dropdown(VALUES_FOR_SINGLE_DROPDOWN_BOX[0])
      jquery_form.click_on_search_result_in_search_dropdown
      expect(jquery_form.get_select_value_from_search_dropdown).to eq VALUES_FOR_SINGLE_DROPDOWN_BOX[0]

      jquery_form.click_on_search_dropdown
      jquery_form.search_in_search_dropdown(VALUES_FOR_SINGLE_DROPDOWN_BOX[1])
      expect(jquery_form.present_no_result_from_search_dropdown).to eq NO_RESULT_FOUND
    end

    it 'user is able to search and select multi value in multi dropdown box' do
      VALUES_FOR_MULTI_DROPDOWN_BOX.each do |search_value|
        jquery_form.search_on_multi_dropdown(search_value)
        jquery_form.click_on_search_result_multi_dropdown
      end

      VALUES_FOR_MULTI_DROPDOWN_BOX.each do |search_value|
        expect(jquery_form.element_is_present_in_multi_dropdown?(search_value)).to eq true
      end
    end

    it 'user is able to search and select single value in dropdown box with disabled value' do
      jquery_form.click_on_disabled_dropdown
      jquery_form.search_value_on_disabled_dropdown(VALUES_FOR_DROPDOWN_BOX_WITH_DISABLED_VALUES[0])
      jquery_form.click_on_search_result_in_disabled_dropdown
      expect(jquery_form.get_select_value_from_disabled_dropdown).to eq VALUES_FOR_DROPDOWN_BOX_WITH_DISABLED_VALUES[0]

      jquery_form.click_on_disabled_dropdown
      jquery_form.search_value_on_disabled_dropdown(VALUES_FOR_DROPDOWN_BOX_WITH_DISABLED_VALUES[1])
      jquery_form.click_on_search_result_in_disabled_dropdown
      expect(jquery_form.get_select_value_from_disabled_dropdown).not_to eq VALUES_FOR_DROPDOWN_BOX_WITH_DISABLED_VALUES[1]
    end
  end
end
