require 'rails_helper'

RSpec.describe Category, type: :model do
  before :all do
    @user = User.create(email: 'user@email.com', password: 'password', id: 1)
    @category = @user.categories.build(title: 'Chores',
                                       description: 'lorem ipsum',
                                       user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a title' do
    @category.title = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without a description' do
    @category.description = nil
    expect(@category).to_not be_valid
  end
end
