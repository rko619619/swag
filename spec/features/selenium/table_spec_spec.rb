feature 'Table' do
  let(:table_pagination) { TablePaginationPage.new }

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
end
