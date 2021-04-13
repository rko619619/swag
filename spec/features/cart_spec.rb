xfeature 'Basket' do
  let(:login_page)  { LoginPage.new }
  let(:main_page)   { Visit.new }
  let(:basket_page) { BasketOnMainPage.new }
  let(:basket)      { Basket.new }
  let(:item_page)   { Item.new }

  before { visit LOGIN_PAGE }

  it 'add a one item to basket from main page, correct number is displayed on main page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    # basket_page.item_button.click

    # expect(basket_page.basket_on_page.text).to eq('1')
  end

  it 'remove a one item from basket from main page, correct number is displayed on main page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    basket_page.item_button.click
    basket_page.item_remove.click

    expect(basket_page.basket_on_page.text).to eq('')
  end

  it 'add a one item to basket from main page, correct number, name, description is displayed on basket page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    name = basket_page.item_name.text
    description = basket_page.item_description.text
    basket_page.item_button.click

    basket_page.basket_on_page.click

    expect(basket.item_name.text).to eq(name)
    expect(basket.item_description.text).to eq(description)
    expect(basket.item_count.text).to eq('1')
  end

  it 'remove a one item from basket from basket page, correct number, name, description is displayed on basket page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    basket_page.item_button.click
    basket_page.basket_on_page.click
    basket.item_remove.click

    expect(basket.basket_count.text).to eq('')
  end

  it 'add a one item to basket from item page, correct number is displayed on item page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    basket_page.item_name.click
    basket_page.item_button.click

    expect(basket_page.basket_on_page.text).to eq('1')
  end

  it 'remove a one item from basket from item page, correct number is displayed on item page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    basket_page.item_name.click
    basket_page.item_button.click
    basket.item_remove.click

    expect(basket_page.basket_on_page.text).to eq('')
  end

  it 'add a one item to basket from item page, correct number, name, description is displayed on basket page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    basket_page.item_name.click

    name = item_page.item_name.text
    description = item_page.item_description.text
    item_page.item_button.click

    basket_page.basket_on_page.click

    expect(basket.item_name.text).to eq(name)
    expect(basket.item_description.text).to eq(description)
    expect(basket.item_count.text).to eq('1')
  end

  it 'remove all items from menu, correct number is displayed on main page' do
    login_page.fill_login_form(VALID_NAME, VALID_PASSWORD)

    main_page.menu_button.click
    main_page.reset.click

    expect(basket_page.basket_on_page.text).to eq('')
  end
end
