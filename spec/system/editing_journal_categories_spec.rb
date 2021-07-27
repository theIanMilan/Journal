require 'rails_helper'

RSpec.describe "EditingJournalCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "edits a category's title and displays category" do
    # Create first
    visit '/categories/new'
    fill_in 'Title', with: 'Chores'
    fill_in 'Description', with: 'Listing of all household chores'
    click_on 'Create Category'

    # And then edit
    id = Category.last.id.to_s
    visit '/categories/' + id
    click_link 'Edit'
    expect(page).to have_content('Edit Category')

    fill_in 'Title', with: 'Chores Edited'
    click_on 'Update Category'

    expect(page).to have_content('Chores Edited')
    category = Category.find(id)
    expect(category.title).to eq('Chores Edited')
  end

  it "edits a category's description and displays category" do
    # Create first
    visit '/categories/new'
    fill_in 'Title', with: 'Chores'
    fill_in 'Description', with: 'Listing of all household chores'
    click_on 'Create Category'

    # And then edit
    id = Category.last.id.to_s
    visit '/categories/' + id
    click_link 'Edit'
    expect(page).to have_content('Edit Category')

    fill_in 'Description', with: 'Listings Edited!'
    click_on 'Update Category'

    expect(page).to have_content('Listings Edited!')
    category = Category.find(id)
    expect(category.description).to eq('Listings Edited!')
  end
end