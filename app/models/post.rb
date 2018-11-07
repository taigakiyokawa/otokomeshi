class Post < ApplicationRecord
  mount_uploader :meshim, ImageUploader
  validates :title, {presence: true, length: {maximum: 12}}
  validates :meshim, presence: true
  validates :body, {length: {maximum: 40}}
  
  has_many :likes, dependent: :destroy
  belongs_to :user

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      all #全て表示。
    end
  end

end