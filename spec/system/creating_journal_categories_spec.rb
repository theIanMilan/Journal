require 'rails_helper'

RSpec.describe "CreatingJournalCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays a category' do
    visit '/category/new'

    fill_in 'Title', with: 'Chores'

    fill_in 'Description', with: 'Listing of all household chores'

    click_on 'Create Category'

    expect(page).to have_content('Chores')
    expect(page).to have_content('Listing of all household chores')
    
    category = Category.order("id").last
    expect(category.title).to eq('Chores')
    expect(category.description).to eq('Listing of all household chores')
  end
end
