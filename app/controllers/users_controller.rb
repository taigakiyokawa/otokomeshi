class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
    @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
    @like_posts = Post.where(id: @user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
    @user_posts = Post.where(user_id: @user.id).order(created_at: :desc)
    
  end
end
