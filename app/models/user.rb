class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  class User < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :posts, dependent: :destroy
  end

  mount_uploader :user_img, ImageUploader
  
end