class Task < ApplicationRecord
  belongs_to :category

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :deadline
  validates :completed, inclusion: [true, false]
end