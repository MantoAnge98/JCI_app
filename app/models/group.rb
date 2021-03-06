class Group < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  validates :description, presence: true

  paginates_per 5
end
