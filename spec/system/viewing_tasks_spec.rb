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
    @task = @category.tasks.create(title: 'Task title', description: 'Task description')
  end

  before :each do
    login_as(@user, scope: :user)
  end

  it '' do
  end

  it 'edit and saves a task' do
    visit category_path(@category.id)

    click_link 'Edit Task'

    visit edit_category_task_path(@category, @task)

    fill_in 'Title', with: 'edittitletask'
    fill_in 'Description', with: 'editdescriptiontask'

    click_on 'Submit Edit'

    visit category_path(@category.id)

    expect(page).to have_content('edittitletask')
    expect(page).to have_content('editdescriptiontask')

    task = @category.tasks.order('id').last
    expect(task.title).to eq('edittitletask')
    expect(task.description).to eq('editdescriptiontask')
  end

  # Clean database
  after :all do
    User.destroy_all
  end
end
