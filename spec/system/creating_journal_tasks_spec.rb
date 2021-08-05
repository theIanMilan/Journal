require 'rails_helper'

RSpec.describe "CreatingJournalTasks", type: :system do
    before :all do
        @category = Category.create(title: 'Category title', description: 'Category description')
    end

    before do
        driven_by(:rack_test)
    end

    it 'saves and displays a task' do
        # visit a category url with a specific index
        visit "/categories/#{@category.id}"
       
        expect do
            within 'form' do
                 # fill up form 
                fill_in 'Title', with: 'Tasks'
                fill_in 'Description', with: 'To do'
                # click 'Create Task'
                click_link 'Create Task'
                # expect page to be in the same url
                expect(page).to have_current_path
            end
        end

        # 'Tasks' & 'To do' content should be displayed
        expect(page).to have_content('Tasks')
        expect(page).to have_content('To do')
    end
end

# task = Category.last.tasks.last
# visit "/categories/#{@category.id}/tasks/#{task.id}"

# task = Category.tasks.order("id").last
# expect(task.title).to eq('Tasks')
# expect(task.description).to eq('To do')