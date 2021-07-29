require 'rails_helper'

RSpec.describe 'ViewingJournalCategories', type: :system do
  before do
    driven_by(:rack_test)
  end

  it "View a category to show the category's details" do
    # Create first
    visit '/categories/new'
    fill_in 'Title', with: 'Chores'
    fill_in 'Description', with: 'Listing of all household chores'
    click_on 'Create Category'

    # View
    id = Category.last.id.to_s
    visit "/categories/#{id}"
    expect(page).to have_content('Listing of all household chores')
    category = Category.find(id)
    expect(category.description).to eq('Listing of all household chores')
  end
end
