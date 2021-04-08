require './pages/login_page.rb'
require './test_data/sign_in.rb'

feature 'Visit page' do
  subject { Login.new }
  it 'without sign_in' do
    visit(MAIN_URL)
    expect(subject.error_message.text).to eq(DENIED_ACCESS)
  end
end
