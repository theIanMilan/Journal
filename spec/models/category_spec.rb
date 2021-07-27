require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { 
    described_class.new(title: "Chores",
                        description: "lorem ipsum") 
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description"do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end