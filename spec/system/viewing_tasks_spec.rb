require 'rails_helper'

RSpec.describe 'ViewingTasks', type: :system do
  before do
    driven_by(:rack_test)
  end

  before :all do
    # Devise gem rspec helper
    @user = User.create(email: 'askIan@example.com', password: 'f4k3p455w0rd')

    # Clean database and create a Category
    Category.destroy_all
    @category = @user.categories.create(title: 'Category title', description: 'Category description')
    @task = @category.tasks.create(title: 'Clean',
                                   description: 'Clean bedroom',
                                   deadline: 'Thu, 12 Aug 2021 13:00:00.000000000 UTC +00:00',
                                   completed: false)
  end

  before :each do
    login_as(@user, scope: :user)
  end

  it 'view all tasks under specific category page' do
    visit category_path(@category)
    expect(page).to have_content('Clean')
    expect(page).to have_content('August 12, 2021')
    expect(page).to have_content('Pending')
  end

  it 'view specific task under its own page' do
    visit category_task_path(@category, @task)
    expect(page).to have_content('Clean')
    expect(page).to have_content('Clean bedroom')
    expect(page).to have_content('August 12, 2021')
    expect(page).to have_content('Pending')
  end

  it 'edit and saves a task' do
    # visit category_path(@category.id)

    # click_link 'Edit'

    visit edit_category_task_path(@category, @task)

    fill_in 'Title', with: 'edittitletask'
    fill_in 'Description', with: 'editdescriptiontask'
    find('.datepicker').set('August 19, 2021 12:00')
    page.check('task_completed')

    click_on 'Submit'

    expect(page).to have_content('edittitletask')
    expect(page).to have_content('August 19, 2021')
    expect(page).to have_content('Accomplished')

    task = @category.tasks.order('id').last
    expect(task.title).to eq('edittitletask')
    expect(task.description).to eq('editdescriptiontask')
    expect(task.deadline.strftime('%B %d, %Y %H:%M %p')).to eq('August 19, 2021 12:00 PM')
    expect(task.completed).to eq(true)
  end

  it 'tasks can be deleted' do
    @task.destroy
    expect(@category.tasks.find_by(title: 'Clean')).to be_nil
  end

  # Clean database
  after :all do
    User.destroy_all
  end
end
