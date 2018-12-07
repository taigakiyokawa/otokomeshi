class Post < ApplicationRecord
  mount_uploader :meshim, MeshiUploader
  validates :title, {presence: true, length: {maximum: 12}}
  validates :meshim, presence: true
  validates :body, {length: {maximum: 40}}
  
  has_many :likes, dependent: :destroy
  belongs_to :user
  belongs_to :task, optional: true #　参照先のtaskが無くても(＝task_idが空でも)ok 
  default_scope -> { order(created_at: :desc) }

  # 一時的なメンバ変数
  attr_accessor :is_appare

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
      .or(Post.where(['body LIKE ?', "%#{search}%"]))
    else
      all #全て表示。
    end
  end
end