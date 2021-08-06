class Task < ApplicationRecord
  # a task belongs to a category
  belongs_to :category, dependent: :destroy
end