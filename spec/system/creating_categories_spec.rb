require 'rails_helper'

RSpec.describe "CreatingCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    # Devise gem rspec helper
    user = User.create(:email => 'test123@example.com', :password => 'f4k3p455w0rd')
    login_as(user, :scope => :user)
  end

  it 'saves and displays a category' do
    visit '/categories/new'

    fill_in 'Title', with: 'Chores'

    fill_in 'Description', with: 'Listing of all household chores'

    click_on 'Create Category'

    visit '/categories/'
    expect(page).to have_content('Chores')
    expect(page).to have_content('Listing of all household chores')

    category = Category.order("id").last
    expect(category.title).to eq('Chores')
    expect(category.description).to eq('Listing of all household chores')
  end

  # Clean database
  after :all do
    User.destroy_all
  end
end
