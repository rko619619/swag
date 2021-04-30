feature 'Input forms' do
  let(:simple_form)          { SimpleFormPage.new   }
  let(:checkbox_form)        { CheckboxFormPage.new }
  let(:radio_buttons_form)   { RadioButtonsPage.new }
  let(:dropdown_form)        { DropdownFormPage.new }
  let(:input_form)           { InputFormPage.new    }
  let(:ajax_form)            { AjaxFormPage.new     }
  let(:jquery_form)          { JqueryFormPage.new   }

  context 'Simple Form', tag: 'regression' do
    before { visit SIMPLE_FORM_DEMO }

    MESSAGE_SINGLE_FIELD = Faker::Alphanumeric.alpha(number: 10)

    it 'user is able to fill single input' do
      simple_form.fill_single_field(MESSAGE_SINGLE_FIELD)
      expect(simple_form.get_message_from_single_field).to eq MESSAGE_SINGLE_FIELD
    end

    it 'user is able to fill two input' do
      first_value = rand(50)
      second_value = rand(50)
      sum = first_value + second_value
      simple_form.fill_multiple_field(first_value, second_value)
      expect(simple_form.get_message_from_two_fields).to eq sum.to_s
    end
  end

  context 'Checkbox', tag: 'regression' do
    before { visit CHECKBOX_DEMO }

    OPTIONS = ['Option 1', 'Option 2', 'Option 3', 'Option 4']
    selected_option = OPTIONS.sample

    it 'user is able to click single checkbox' do
      checkbox_form.click_single_checkbox
      expect(checkbox_form.get_message_from_single_checkbox).to eq STATUS_OF_SINGLE_CHECKBOX
    end

    it 'user is able to click multiple checkbox' do
      checkbox_form.click_multiple_checkbox
      expect(checkbox_form.status_of_select_option?(selected_option, 'check')).to eq true

      checkbox_form.click_multiple_checkbox
      expect(checkbox_form.status_of_select_option?(selected_option, 'uncheck')).to eq true
    end
  end

  context 'Radio buttons', tag: 'regression' do
    before { visit RADIO_BUTTONS_DEMO }

    SEX = %w[Male Female]
    AGE = ['0 - 5', '5 - 15', '15 - 50']
    selected_sex = SEX.sample
    selected_age = AGE.sample

    it 'user is able to click on single radio button and get the selected value' do
      radio_buttons_form.click_radio_button(selected_sex)
      radio_buttons_form.click_on_get_checked_button
      expect(radio_buttons_form.get_correct_message_of_radio_buttons?(selected_sex)).to eq true
    end

    it 'user is able to click on group radio button and get the selected values from Group Sex and Age group' do
      radio_buttons_form.click_on_group_radio_buttons(selected_sex, selected_age)
      radio_buttons_form.click_on_get_value_button
      expect(radio_buttons_form.correct_message_of_group_radio_buttons_is_get?(selected_sex, selected_age)).to eq true
    end
  end

  context 'Select list', tag: 'regression' do
    before { visit SELECT_DROPDOWN_DEMO }

    DAYS = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
    selected_days = DAYS.sample
    it 'user is able to select value from the list' do
      dropdown_form.select_value_in_select_list(selected_days)
      expect(dropdown_form.correct_value_of_select_list_is_get?(selected_days)).to eq true
    end
  end

  context 'Input form with validations', tag: 'regression' do
    before { visit INPUT_FORM_SUBMIT }

    INVALID_VALUE = Faker::Alphanumeric.alpha(number: 1)

    it 'user is not able to send form with empty value' do
      input_form.click_send_button
      expect(input_form.get_messages_from_input_form).to eq EMPTY_LIST
    end

    it 'user is not able to send form with unvalid value' do
      input_form.fill_form_with_invalid_values(INVALID_VALUE)
      expect(input_form.get_messages_from_input_form).to eq INVALID_LIST
    end

    it 'user is able to send form with valid value ' do
      input_form.fill_form_with_valid_values
      input_form.click_send_button
      expect(input_form.get_messages_from_input_form).to eq []
    end
  end

  context 'Ajax Form Submit with Loading icon ', tag: 'regression' do
    before { visit AJAX_FORM_SUBMIT }

    VALUE_FOR_AJAX_FORM = Faker::Alphanumeric.alpha(number: 20)

    it 'user is able to submit ajax form' do
      ajax_form.fill_ajax_form(VALUE_FOR_AJAX_FORM)
      ajax_form.click_submit_button
      expect(ajax_form.proccesing_message_is_get?).to eq true
      ajax_form.wait_success_message
    end
  end

  context 'Jquery select dropdown', tag: 'regression' do
    before { visit JQUERY_SELECT_DROPDOWN }

    # single dropdown
    VALID_VALUES_FOR_SINGLE_DROPDOWN_BOX = %w[Denmark Australia Bangladesh India Japan]
    INVALID_VALUES_FOR_SINGLE_DROPDOWN_BOX = 'Invalid value'
    valid_values_for_single_dropdown = VALID_VALUES_FOR_SINGLE_DROPDOWN_BOX.sample

    # multi dropdown
    VALUES_FOR_MULTI_DROPDOWN_BOX = %w[California Colorado Alabama Alaska Arizona]
    values_multi_for_dropdown = VALUES_FOR_MULTI_DROPDOWN_BOX.sample(2)

    # disabled dropdown
    VALUES_FOR_DISABLED_DROPDOWN = ['American Samoa', 'Northern Mariana Islands', 'Puerto Rico']
    DISABLED_VALUES_FOR_DISABLED_DROPDOWN = ['Guam', 'United States Minor Outlying Islands']
    valid_values_for_disabled_dropdown = VALUES_FOR_DISABLED_DROPDOWN.sample
    disabled_value_for_disabled_dropdown = DISABLED_VALUES_FOR_DISABLED_DROPDOWN.sample

    it 'user is able to search and select value in single dropdown box' do
      jquery_form.click_on_search_dropdown
      jquery_form.search_in_search_dropdown(valid_values_for_single_dropdown)
      jquery_form.click_on_search_result_in_search_dropdown
      expect(jquery_form.get_select_value_from_search_dropdown).to eq valid_values_for_single_dropdown

      jquery_form.click_on_search_dropdown
      jquery_form.search_in_search_dropdown(INVALID_VALUES_FOR_SINGLE_DROPDOWN_BOX)
      expect(jquery_form.present_no_result_from_search_dropdown).to eq NO_RESULT_FOUND
    end

    it 'user is able to search and select multi value in multi dropdown box' do
      values_multi_for_dropdown.each do |search_value|
        jquery_form.search_on_multi_dropdown(search_value)
        jquery_form.click_on_search_result_multi_dropdown
      end

      values_multi_for_dropdown.each do |search_value|
        expect(jquery_form.element_is_present_in_multi_dropdown?(search_value)).to eq true
      end
    end

    it 'user is able to search and select single value in disabled dropdown' do
      jquery_form.click_on_disabled_dropdown
      jquery_form.search_value_on_disabled_dropdown(valid_values_for_disabled_dropdown)
      jquery_form.click_on_search_result_in_disabled_dropdown
      expect(jquery_form.get_select_value_from_disabled_dropdown).to eq valid_values_for_disabled_dropdown

      jquery_form.click_on_disabled_dropdown
      jquery_form.search_value_on_disabled_dropdown(disabled_value_for_disabled_dropdown)
      jquery_form.click_on_search_result_in_disabled_dropdown
      expect(jquery_form.get_select_value_from_disabled_dropdown).not_to eq disabled_value_for_disabled_dropdown
    end
  end
end
