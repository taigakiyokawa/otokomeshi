class Post < ApplicationRecord
  mount_uploader :meshim, ImageUploader
  validates :title, presence: true
  validates :meshim, presence: true

  class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
  end
end
