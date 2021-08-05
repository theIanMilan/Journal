require 'rails_helper'

RSpec.describe "LoginUserAccountWithCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    # Devise gem rspec helper
    @user = User.create(:email => 'test11@example.com', :password => 'f4k3p455w0rd')
    @user2 = User.create(:email => 'test12@example.com', :password => 'f4k3p455w0rd')
  end

  it 'Logs in user through login page' do
    visit root_path
    click_link 'Login'

    fill_in 'Email', with: 'test11@example.com'
    fill_in 'Password', with: 'f4k3p455w0rd'
    click_on 'Log in'

    expect(page).to have_content('test11@example.com')
  end
end
