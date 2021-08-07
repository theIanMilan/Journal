class Category < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :tasks, dependent: :destroy

  validates_presence_of :title
  validates_presence_of :description
end
