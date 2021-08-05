class Category < ApplicationRecord
  # a category has many tasks
  has_many :tasks

  validates_presence_of :title
  validates_presence_of :description
end