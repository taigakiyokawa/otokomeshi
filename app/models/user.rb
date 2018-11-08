class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]
  
  validates :username, {presence: true, uniqueness: true, length: {maximum: 16}}

  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy

  mount_uploader :user_img, ImageUploader
  
end