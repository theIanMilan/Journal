require 'rails_helper'

RSpec.describe 'ViewingCategories', type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    # Devise gem rspec helper
    @user = User.create(:email => 'test99@example.com', :password => 'f4k3p455w0rd')

    # Clean database and create a Category
    Category.destroy_all
    @category = @user.categories.create(title: 'Chores', description: 'Household activities to do')
  end

  before :each do 
    login_as(@user, :scope => :user)
  end

  it 'View all categories includes newly created data at index.html.erb' do
    visit '/categories'
    expect(page).to have_content('Household activities to do')
    expect(@category.description).to eq('Household activities to do')
  end

  it 'View a specific category and test its show.html.erb page' do
    visit "/categories/#{@category.id}"
    expect(page).to have_content('Household activities to do')
    expect(@category.description).to eq('Household activities to do')
  end

  it 'Edits a categorys title and displays category' do
    visit "/categories/#{@category.id}/edit"
    # first(:link, 'Edit').click

    fill_in 'Title', with: 'Chores Edited'
    click_on 'Update Category'

    expect(page).to have_content('Chores Edited')
    expect(Category.last.title).to eq('Chores Edited')
  end

  it 'Edits a categorys description and displays category' do
    visit edit_category_path(@category)
    # first(:link, 'Edit').click

    fill_in 'Description', with: 'Listings Edited!'
    click_on 'Update Category'

    expect(page).to have_content('Listings Edited!')
    expect(Category.last.description).to eq('Listings Edited!')
  end

  it 'Category can be deleted' do
    @category.destroy
    expect(Category.find_by(title: 'Chores')).to be_nil
  end

  # Clean database
  after :all do
    User.destroy_all
  end
end
