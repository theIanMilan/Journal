require 'rails_helper'

RSpec.describe "EditingJournalTasks", type: :system do
    before :all do
        @task = Task.create(title: 'Task title', description: 'My to do content')
    end

    it 'can edit new posts' do
        visit "/tasks/#{@task.id}/edit"

        fill_in 'Title', with: 'Edited task'
        
        fill_in 'Category', with: 'Edited listing of my to do'

        #deadline #bagong form
        
        click_on 'Update Task'

        expect(page).to have_content('Edited task')
        expect(page).to have_content('Edited listing of my to do')
        
        editedTask = Task.order("id").last
        expect(editedTask.title).to eq('Edited task')
        expect(editedTask.description).to eq('Edited listing of my to do')
    end
end