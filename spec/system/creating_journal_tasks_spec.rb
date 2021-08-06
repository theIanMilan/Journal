require 'rails_helper'

RSpec.describe "CreatingJournalTasks", type: :system do
    before do
        driven_by(:rack_test)
    end

    before :all do
        # Devise gem rspec helper
        @user = User.create(:email => 'test1234@example.com', :password => 'f4k3p455w0rd')
    
        # Clean database and create a Category
        Category.destroy_all
        @category = @user.categories.create(title: 'Category title', description: 'Category description')
    end

    before :each do 
        login_as(@user, :scope => :user)
    end

    it 'saves and displays a task' do
        visit category_path(@category.id)

        # click add task link
        click_link 'Add Task'

        # # visit new task form
        visit new_category_task_path(@category.id)

        # fill up form 
        fill_in 'Title', with: 'titletask'
        fill_in 'Description', with: 'descriptiontask'

        # click create task button
        click_on 'Create Task'

        # visit back to category url with a specific id
        visit category_path(@category.id)

        # expect page to have the value of both title and description
        expect(page).to have_content("titletask")
        expect(page).to have_content("descriptiontask")
        
        # check activerecord
        task = @category.tasks.order("id").last
        expect(task.title).to eq('titletask')
        expect(task.description).to eq('descriptiontask')
    end
end