feature 'Table' do
  let(:table_pagination)             { TablePaginationPage.new   }
  let(:table_with_search_and_filter) { TableSearchFilterPage.new }

  context 'Table with pagination', tag: 'regression' do
    before { visit TABLE_PAGINATION }

    TOTAL_TABLE_RECORD = 13

    it 'user is able to navigate by prev and next buttons' do
      # check that all records are present in page
      expect(table_pagination.get_count_of_records_from_table).to eq TOTAL_TABLE_RECORD
      table_pagination.click_on_next_button

      # check that next button is working
      expect(table_pagination.check_that_value_on_page?).to eq false
      expect(table_pagination.page_has_buttons_for_navigate?).to eq true
      table_pagination.click_on_next_button

      # check that prev button is working
      expect(table_pagination.check_that_value_on_page?).to eq false
      table_pagination.click_on_prev_button
      expect(table_pagination.check_that_value_on_page?).to eq true
    end
  end

  context 'Table with search and filter', tag: 'regression' do
    before { visit TABLE_WITH_SEARCH_AND_FILTER }

    DATA_FOR_TASKS = ['Wireframes', 'Landing Page', 'SEO tags', '	Bootstrap 3'].freeze
    DATA_FOR_ASSIGNEE = ['John Smith', 'Mike Trout', 'Loblab Dan'].freeze
    DATA_FOR_STATUS = ['in progress', 'completed', 'failed qa'].freeze

    data_for_tasks = DATA_FOR_TASKS.sample
    data_for_assignee = DATA_FOR_ASSIGNEE.sample
    data_for_status = DATA_FOR_STATUS.sample

    it 'user is able to search and filter data in tasks table' do
      # filter by tasks
      table_with_search_and_filter.input_value_for_search_in_table_task(data_for_tasks)
      expect(table_with_search_and_filter.filter_value_by_tasks_in_table_tasks?(data_for_tasks)).to eq true

      # filter by assignee
      table_with_search_and_filter.input_value_for_search_in_table_task(data_for_assignee)
      expect(table_with_search_and_filter.filter_value_by_assignee_in_table_tasks?(data_for_assignee)).to eq true

      # filter by status
      table_with_search_and_filter.input_value_for_search_in_table_task(data_for_status)
      expect(table_with_search_and_filter.filter_value_by_status_in_table_tasks?(data_for_status)).to eq true
    end

    DATA_FOR_ID = %w[1 2 3 4].freeze
    DATA_FOR_USERNAME = %w[markino jacobs larrypt mikesali].freeze
    DATA_FOR_FIRS_NAME = %w[Zieko Daniel Brigade Byron].freeze
    DATA_FOR_LAST_NAME = %w[Samuels Karano Swarroon Kathaniko].freeze

    data_for_id = DATA_FOR_ID.sample
    data_for_username = DATA_FOR_USERNAME.sample
    data_for_first_name = DATA_FOR_FIRS_NAME.sample
    data_for_last_name = DATA_FOR_LAST_NAME.sample

    it 'user is able to search and filter data in tasks table' do
      expect(table_with_search_and_filter.check_that_filter_fields_is_disabled?).to eq true
      table_with_search_and_filter.click_on_filter_icon_in_table_filter

      table_with_search_and_filter.input_id_field_in_filter_table(data_for_id)
      expect(table_with_search_and_filter.filter_value_by_id_in_filter_tabel?(data_for_id)).to eq true

      table_with_search_and_filter.input_username_field_in_filter_table(data_for_username)
      expect(table_with_search_and_filter.filter_value_by_username_in_filter_table?(data_for_username)).to eq true

      table_with_search_and_filter.input_first_name_field_in_filter_table(data_for_first_name)
      expect(table_with_search_and_filter.filter_value_by_firstname_in_filter_table?(data_for_first_name)).to eq true

      table_with_search_and_filter.input_last_name_field_in_filter_table(data_for_last_name)
      expect(table_with_search_and_filter.filter_value_by_lastname_in_filter_table?(data_for_last_name)).to eq true

      table_with_search_and_filter.input_username_field_in_filter_table(Faker::Internet.email)
      expect(table_with_search_and_filter.get_no_result_message).to eq NO_RESULT_FOUND
    end
  end
end
