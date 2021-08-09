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
    @task = @category.tasks.create(title: 'Clean', description: 'Clean bedroom')
  end

  before :each do
    login_as(@user, scope: :user)
  end

  it 'view all tasks under specific category page' do
    visit category_path(@category)
    expect(page).to have_content('Clean')
  end

  it 'view specific task under its own page' do
    visit category_task_path(@category, @task)
    expect(page).to have_content('Clean')
    expect(page).to have_content('Clean bedroom')
  end

  it 'edit and saves a task' do
    visit category_path(@category.id)

    click_link 'Edit'

    visit edit_category_task_path(@category, @task)

    fill_in 'Title', with: 'edittitletask'
    fill_in 'Description', with: 'editdescriptiontask'

    click_on 'Submit'

    visit category_path(@category.id)

    expect(page).to have_content('edittitletask')
    expect(page).to have_content('editdescriptiontask')

    task = @category.tasks.order('id').last
    expect(task.title).to eq('edittitletask')
    expect(task.description).to eq('editdescriptiontask')
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
