require 'rails_helper'

RSpec.describe "CreatingJournalTasks", type: :system do
    before do
        driven_by(:rack_test)
    end

    it 'saves and displays a task' do
        visit '/tasks'

        fill_in 'Title', with: 'Tasks'
        
        fill_in 'Description', with: 'Listing of my to do'

        #deadline #bagong form

        click_on 'Create Task'

        expect(page).to have_content('Tasks')
        expect(page).to have_content('Listing of my to do')

        task = Task.order("id").last
        expect(task.title).to eq('Tasks')
        expect(task.description).to eq('Listing of my to do')
    end
end