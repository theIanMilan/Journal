class Task < ApplicationRecord
  belongs_to :category, dependent: :destroy
end