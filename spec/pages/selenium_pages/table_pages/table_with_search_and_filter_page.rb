class TableSearchFilterPage < SitePrism::Page
  # table with search and filter data in table tasks
  element :search_with_filter_field_in_table_tasks, "#task-table-filter"
  element :search_results_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody'
  elements :tasks_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[2]'
  elements :assignee_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[3]'
  elements :status_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[4]'

  # table with filter icon
  elements :disabled_fields_in_table_with_filter_icon, :xpath, '//table/thead/tr/th/input'
  element :filter_icon_button, '.btn-filter'


  # table with search and filter data
  def input_value_for_search_in_table_task(value)
    search_with_filter_field_in_table_tasks.set(value)
  end

  def get_search_results_from_table_tasks
    search_results_from_table_tasks.text
  end

  def filter_value_by_tasks_in_table_tasks?(filter_value)
    check_value_in_table_tasks?(tasks_field_from_table_tasks, filter_value)
  end

  def filter_value_by_assignee_in_table_tasks?(filter_value)
    check_value_in_table_tasks?(assignee_field_from_table_tasks, filter_value)
  end

  def filter_value_by_status_in_table_tasks?(filter_value)
    check_value_in_table_tasks?(status_field_from_table_tasks, filter_value)
  end

  def check_that_filter_fields_is_disabled?
    check = true
    disabled_fields_in_table_with_filter_icon.each do |element|
      if not element.disabled?
        check = false
      end
    end
    check
  end

  def click_on_filter_icon_in_table_filter
    filter_icon_button.click
  end

  def check_that_filter_fields_is_not_disabled?
    check = true
    disabled_fields_in_table_with_filter_icon.each do |element|
      if not element.disabled?
        check = false
      end
    end
    check
  end

end

