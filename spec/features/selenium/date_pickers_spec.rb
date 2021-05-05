feature 'Date pickers' do
  let(:bootstrap_date_pickers)  { BootstrapDatepickersPage.new }
  let(:jquery_date_pickers )    { JqueryDatepickersPage.new    }

  context 'Bootstrap Date Pickers', tag: 'regression' do
    before { visit BOOTSTRAP_DATE_PICKERS }

    it 'user is able to pick date in date example' do
      bootstrap_date_pickers.click_on_date_example
      expect(bootstrap_date_pickers.check_future_is_disabled_in_date_example?).to eq true
      expect(bootstrap_date_pickers.check_sunday_is_disabled_in_date_example?).to eq true
      expect(bootstrap_date_pickers.check_week_is_start_from_monday_in_date_example?).to eq true
    end

    it 'user is able to pick date in date range' do
      bootstrap_date_pickers.click_on_date_range
      expect(bootstrap_date_pickers.check_sunday_is_disabled_in_date_range?).to eq true
      expect(bootstrap_date_pickers.check_week_is_start_from_sunday_in_date_range?).to eq true
    end
  end

  context 'JQuery Date Picker', tag: 'regression' do
    before { visit JQUERY_DATE_PICKERS }

    it 'user is able to pick date range in date range' do
      expect(jquery_date_pickers.table_have_from_box?).to eq true
      expect(jquery_date_pickers.table_have_to_box?).to eq true
      jquery_date_pickers.click_on_from_date_field
      expect(bootstrap_date_pickers.check_future_is_disabled_in_date_example?).to eq true
      expect(bootstrap_date_pickers.check_sunday_is_disabled_in_date_example?).to eq true
      expect(bootstrap_date_pickers.check_week_is_start_from_monday_in_date_example?).to eq true
    end
  end
end

