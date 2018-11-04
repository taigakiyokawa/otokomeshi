class Post < ApplicationRecord
  mount_uploader :meshim, ImageUploader
  validates :title, presence: true
  validates :meshim, presence: true
  
  has_many :likes, dependent: :destroy
end
