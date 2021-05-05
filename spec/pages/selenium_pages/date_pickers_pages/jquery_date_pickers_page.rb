class JqueryDatepickersPage < SitePrism::Page
  # date range
  element :from_date_field, ''
  element :to_date_field,''

  def table_have_from_box?
    page.find('#from')
  end

  def table_have_to_box?
    page.find('#to')
  end
end

