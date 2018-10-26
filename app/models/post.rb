class Post < ApplicationRecord
  mount_uploader :meshim, ImageUploader
  validates :title, presence: true
  validates :meshim, presence: true
end
