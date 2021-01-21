class Payment < ApplicationRecord
  belongs_to :user
  
  validates :date_payment, presence: true

  validates :note, presence: true

  validates :pay_amount, presence: true

  paginates_per 5
end
