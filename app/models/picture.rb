class Picture < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :image, presence: true
  validates :content, length: { in: 0..140 }
  mount_uploader :image, ImageUploader
end
