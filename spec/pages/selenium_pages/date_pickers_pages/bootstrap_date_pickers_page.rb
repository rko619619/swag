class BootstrapDatepickersPage < SitePrism::Page
  # date example
  element :bootstrap_date_example, "[placeholder='dd/mm/yyyy']"
  element :start_monday_in_date_example, :xpath, '//tr[3]/th[1]'
  elements :disabled_future_days_in_date_example, :xpath, "//tr/td[contains(@class, 'day')][preceding::*[self::td[contains(@class, 'active')]]]"
  elements :disabled_sunday_days_in_date_example, :xpath, '//tr/td[7]'
  # date range
  element :bootstrap_date_range, "[placeholder='Start date']"
  element :start_monday_in_date_range, :xpath, '//tr[3]/th[1]'
  elements :disabled_sunday_days_in_date_range, :xpath, '//tr/td[1]'

  # data example
  def click_on_date_example
    bootstrap_date_example.click
  end

  def check_future_is_disabled_in_date_example?
    check = true
    disabled_future_days_in_date_example.each do |_future_day|
      check = false unless future[:class].include?('disabled')
    end
    check
  end

  def check_sunday_is_disabled_in_date_example?
    check = true
    disabled_sunday_days_in_date_example.each do |sunday_day|
      check = false unless sunday_day[:class].include?('disabled-date')
    end
    check
  end

  def check_week_is_start_from_monday_in_date_example?
    start_monday_in_date_example.text == MONDAY
  end

  # date range
  def click_on_date_range
    bootstrap_date_range.click
  end

  def check_sunday_is_disabled_in_date_range?
    check = true
    disabled_sunday_days_in_date_range.each do |sunday_day|
      check = false unless sunday_day[:class].include?('disabled-date')
    end
    check
  end

  def check_week_is_start_from_sunday_in_date_range?
    start_monday_in_date_range.text == SUNDAY
  end
end
