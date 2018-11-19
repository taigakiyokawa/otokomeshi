class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @like_posts = Post.where(id: @user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
    @posts = Post.where(user_id: @user.id).order(created_at: :desc)

    @user.shogo_first_id = set_shogo_first(@user)
    @shogo_first = ShogoFirst.find_by(id: @user.shogo_first_id)
    @user.shogo_last_id = set_shogo_last(@user) 
    @shogo_last = ShogoLast.find_by(id: @user.shogo_last_id)
  end
end
