require 'rails_helper'

RSpec.describe Task, type: :model do
  before :all do
    @user = User.create(email: 'user@email.com', password: 'password', id: 1)
    @category = @user.categories.build(title: 'Chores',
                                       description: 'lorem ipsum',
                                       user_id: @user.id)
    @task = @category.tasks.build(title: 'Clean dishes',
                                  description: 'Clean clean clean',
                                  category_id: @category.id)
  end

  it 'is valid with valid attributes' do
    expect(@task).to be_valid
  end

  it 'is not valid without a title' do
    @task.title = nil
    expect(@task).to_not be_valid
  end

  it 'is not valid without a description' do
    @task.description = nil
    expect(@task).to_not be_valid
  end
end
