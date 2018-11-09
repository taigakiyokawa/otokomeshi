class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  mount_uploader :user_img, ImageUploader

  validates :username, {length: {maximum: 16}}
  validates :password, presence: true, length: { minimum: 0 }

  
end