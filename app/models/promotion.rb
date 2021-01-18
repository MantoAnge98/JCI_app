class Promotion < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true

  validates :description, presence: true

  validates :year_promotion, presence: true 

  mount_uploader :image_promotion, ImagePromotionUploader

  paginates_per 10
end
