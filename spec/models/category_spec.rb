require 'rails_helper'

RSpec.describe Category, type: :model do
  it "is valud with valid attributes" do
    expect(Category.new).to be_valid
  end

  it "is not valid without a title" do
    category = Category.new(title: nil)
    expect(category).to_not be_valid
  end

  it "is not valid without a description"do
    category = Category.new(description: nil)
    expect(category).to_not be_valid
  end
end