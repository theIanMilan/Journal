class Task < ApplicationRecord
  belongs_to :category, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :description
end