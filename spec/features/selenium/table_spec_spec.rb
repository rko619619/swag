feature 'Table' do
  let(:table_pagination)             { TablePaginationPage.new   }
  let(:table_with_search_and_filter) { TableSearchFilterPage.new }

  context 'Table with pagination', tag: 'regression' do
    before { visit TABLE_PAGINATION }

    TOTAL_TABLE_RECORD = 13

    it 'user is able to navigate by prev and next buttons' do
      expect(table_pagination.collect_records_from_table).to eq TOTAL_TABLE_RECORD
      value_for_check = table_pagination.get_value_for_check
      table_pagination.click_on_next_button
      expect(table_pagination.table_from_page).not_to have_content(value_for_check)
      expect(table_pagination.page_has_buttons_for_navigate?).to eq true
      table_pagination.click_on_next_button
      expect(table_pagination.table_from_page).not_to have_content(value_for_check)
      table_pagination.click_on_prev_button
      table_pagination.click_on_prev_button
      expect(table_pagination.table_from_page).to have_content(value_for_check)
    end
  end

  context 'Table with search and filter', tag: 'regression' do
    before { visit TABLE_WITH_SEARCH_AND_FILTER }

    DATA_FOR_SEARCH_TABLE_TASKS = ['Wireframes', 'Emily John', 'Bug fixing']
    DATA_FOR_TASKS_TABLE_TASKS = ['Wireframes', 'Landing Page', 'SEO tags', '	Bootstrap 3']
    DATA_FOR_ASSIGNEE_TABLE_TASKS = ['John Smith', 'Mike Trout', 'Loblab Dan']
    DATA_FOR_STATUS_TABLE_TASKS = ['in progress', 'completed', 'failed qa']

    it 'user is able to search and filter data in tasks table' do
      table_with_search_and_filter.input_value_for_search_in_table_task(DATA_FOR_SEARCH[1])
      expect(table_with_search_and_filter.get_search_results_from_table_tasks).to have_content(DATA_FOR_SEARCH[1])

      table_with_search_and_filter.input_value_for_search(DATA_FOR_TASKS[1])
      expect(table_with_search_and_filter.filter_value_by_tasks_in_table_tasks?(DATA_FOR_TASKS[1])).to eq true

      table_with_search_and_filter.input_value_for_search(DATA_FOR_ASSIGNEE[1])
      expect(table_with_search_and_filter.filter_value_by_assignee_in_table_tasks?(DATA_FOR_ASSIGNEE[1])).to eq true

      table_with_search_and_filter.input_value_for_search(DATA_FOR_STATUS[1])
      expect(table_with_search_and_filter.filter_value_by_status_in_table_tasks?(DATA_FOR_STATUS[1])).to eq true
    end

    it 'user is able to search and filter data in tasks table' do
      expect(table_with_search_and_filter.check_that_filter_fields_is_disabled?).to eq true
      table_with_search_and_filter.click_on_filter_icon_in_table_filter
      expect(table_with_search_and_filter.check_that_filter_fields_is_not_disabled?).to eq true


      table_with_search_and_filter.input_value_for_search(DATA_FOR_SEARCH[1])
      expect(table_with_search_and_filter.get_search_results_from_table).to have_content(DATA_FOR_SEARCH[1])

      table_with_search_and_filter.input_value_for_search(DATA_FOR_TASKS[1])
      expect(table_with_search_and_filter.filter_value_by_tasks?(DATA_FOR_TASKS[1])).to eq true

      table_with_search_and_filter.input_value_for_search(DATA_FOR_ASSIGNEE[1])
      expect(table_with_search_and_filter.filter_value_by_assignee?(DATA_FOR_ASSIGNEE[1])).to eq true

      table_with_search_and_filter.input_value_for_search(DATA_FOR_STATUS[1])
      expect(table_with_search_and_filter.filter_value_by_status?(DATA_FOR_STATUS[1])).to eq true
    end
  end
end
