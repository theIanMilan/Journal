require 'rails_helper'

RSpec.describe "DeletingJournalCategories", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "Delete a category" do
    # Create first
    visit '/categories/new'
    fill_in 'Title', with: 'Chores'
    fill_in 'Description', with: 'Listing of all household chores'
    click_on 'Create Category'

    # And then delete
    id = Category.last.id.to_s
    visit '/categories/' + id
    click_link 'Delete'

    expect(page).not_to have_content('Chores')
    expect {Category.find(id)}.to raise_error
  end
end
