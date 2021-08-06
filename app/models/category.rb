class Category < ApplicationRecord
  has_many :tasks

  validates_presence_of :title
  validates_presence_of :description
end