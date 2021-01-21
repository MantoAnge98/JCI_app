class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true

  validates :first_name, presence: true

  validates :telephone , presence: true 

  validates :added_since, presence: true

  validates :birthday, presence: true

  validates :profession, presence: true

  belongs_to :promotion

  belongs_to :group

  has_many :payments

  belongs_to :setting
  
  paginates_per 5

  def avatar_thumbnail
    if avatar.present?
      avatar.url
    else
      '/image.png'
    end
  end
end
