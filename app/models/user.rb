class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]
  
  validates :username, {presence: true, uniqueness: true, length: {maximum: 16}}
  validates :password, presence: true, length: { minimum: 1 }
  #登録時にメールアドレスを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end
  
  attr_accessor :x, :y, :width, :height

  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :shogos, dependent: :destroy
  has_many :shogo_firsts, dependent: :destroy

  mount_uploader :user_img, ImageUploader

  def update_without_current_password(params, *options)
   params.delete(:current_password)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end 
    result = update_attributes(params, *options)
    clean_up_passwords
    result 
  end
end