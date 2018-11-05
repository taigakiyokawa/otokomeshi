class Post < ApplicationRecord
  mount_uploader :meshim, ImageUploader
  validates :title, {presence: true, length: {maximum: 12}}
  validates :meshim, presence: true
  validates :body, {length: {maximum: 40}}
  
  has_many :likes, dependent: :destroy
  belongs_to :user
end