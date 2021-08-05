require 'rails_helper'

RSpec.describe "CreatingUserAccounts", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Creates a valid user account through Sign-up page' do
    visit root_path
    click_link 'Sign-up'

    fill_in 'Email', with: 'user10@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'

    expect(page).to have_content('user10@example.com')

    user = User.order("id").last
    expect(user.email).to eq('user10@example.com')
  end
end
