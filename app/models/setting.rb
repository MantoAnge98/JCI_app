class Setting < ApplicationRecord
  has_many :users

  validates :amount_due, presence: true

  validates :devise, presence: true
  
  paginates_per 10
end
