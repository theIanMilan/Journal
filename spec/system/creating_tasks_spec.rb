require 'rails_helper'

RSpec.describe 'CreatingTasks', type: :system do
  before do
    driven_by(:rack_test)
  end

  before :each do
    # Devise gem rspec helper
    @user = User.create(email: 'test1234@example.com', password: 'f4k3p455w0rd')
    login_as(@user, scope: :user)

    @category = @user.categories.create(title: 'Category title', description: 'Category description')
  end

  it 'saves and displays a task' do
    visit category_path(@category.id)

    # click add task link
    click_link 'Add Task +'

    # # visit new task form
    visit new_category_task_path(@category.id)

    # fill up form
    fill_in 'Title', with: 'titletask'
    fill_in 'Description', with: 'descriptiontask'
    find('.datepicker').set('August 11, 2021 12:00')
    page.check('task_completed')

    # click create task button
    click_on 'Submit'

    # expect page to have the value of both title and description
    expect(page).to have_content('titletask')
    expect(page).to have_content('Accomplished')
    expect(page).to have_content('August 11, 2021 12:00 PM')

    # check activerecord
    task = @category.tasks.order('id').last
    expect(task.title).to eq('titletask')
    expect(task.deadline.strftime('%B %d, %Y %H:%M %p')).to eq('August 11, 2021 12:00 PM')
    expect(task.completed).to eq(true)
  end
end
