class TableSearchFilterPage < SitePrism::Page
  # table with search and filter data in table tasks
  element :search_with_filter_field_in_table_tasks, '#task-table-filter'
  element :search_results_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody'
  elements :tasks_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[2]'
  elements :assignee_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[3]'
  elements :status_field_from_table_tasks, :xpath, '//*[@id="task-table"]/tbody/tr/td[4]'

  # table with filter icon
  elements :disabled_fields_in_table_with_filter_icon, :xpath, '//table/thead/tr/th/input'
  element :filter_icon_button, '.btn-filter'
  element :id_field_in_filter_table, ".form-control[placeholder='#']"
  element :username_field_in_filter_table, ".form-control[placeholder='Username']"
  element :first_name_in_filter_table, ".form-control[placeholder='First Name']"
  element :last_name_in_filter_table, ".form-control[placeholder='Last Name']"
  elements :id_field_from_filter_table, :xpath, "//*[@class='table']/tbody/tr/td[1]"
  elements :username_field_from_filter_table, :xpath, "//*[@class='table']/tbody/tr/td[2]"
  elements :firstname_field_from_filter_table, :xpath, "//*[@class='table']/tbody/tr/td[3]"
  elements :lastname_field_from_filter_table, :xpath, "//*[@class='table']/tbody/tr/td[4]"
  element :no_result_message, '.no-result'

  # table with search and filter data
  def input_value_for_search_in_table_task(value)
    input_value_to_field(search_with_filter_field_in_table_tasks, value)
  end

  def get_search_results_from_table_tasks
    search_results_from_table_tasks.text
  end

  def filter_value_by_tasks_in_table_tasks?(filter_value)
    check_value_in_table_tasks(tasks_field_from_table_tasks, filter_value)
  end

  def filter_value_by_assignee_in_table_tasks?(filter_value)
    check_value_in_table_tasks(assignee_field_from_table_tasks, filter_value)
  end

  def filter_value_by_status_in_table_tasks?(filter_value)
    check_value_in_table_tasks(status_field_from_table_tasks, filter_value)
  end

  # filter table
  def check_that_filter_fields_is_disabled?
    check = true
    disabled_fields_in_table_with_filter_icon.each do |element|
      check = false unless element.disabled?
    end
    check
  end

  def click_on_filter_icon_in_table_filter
    filter_icon_button.click
  end

  def check_that_filter_fields_is_not_disabled?
    check = true
    disabled_fields_in_table_with_filter_icon.each do |element|
      check = false unless element.disabled?
    end
    check
  end

  def input_id_field_in_filter_table(value)
    input_value_to_field(id_field_in_filter_table, value)
  end

  def input_username_field_in_filter_table(value)
    input_value_to_field(username_field_in_filter_table, value)
  end

  def input_first_name_field_in_filter_table(value)
    input_value_to_field(first_name_in_filter_table, value)
  end

  def input_last_name_field_in_filter_table(value)
    input_value_to_field(last_name_in_filter_table, value)
  end

  def filter_value_by_id_in_filter_tabel?(filter_value)
    check_value_in_table_tasks(id_field_from_filter_table, filter_value)
  end

  def filter_value_by_username_in_filter_table?(filter_value)
    check_value_in_table_tasks(username_field_from_filter_table, filter_value)
  end

  def filter_value_by_firstname_in_filter_table?(filter_value)
    check_value_in_table_tasks(firstname_field_from_filter_table, filter_value)
  end

  def filter_value_by_lastname_in_filter_table?(filter_value)
    check_value_in_table_tasks(lastname_field_from_filter_table, filter_value)
  end

  def get_no_result_message
    no_result_message.text
  end
end
