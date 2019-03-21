class UsersController < ApplicationController
  include UsersHelper
  before_action :authenticate_user!
  
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])

    @shogo_first = ShogoFirst.find_by(id: @user.shogo_first_id)
    @shogo_last = ShogoLast.find_by(id: @user.shogo_last_id)
    @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)

    @like_posts = Post.where(id: @user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
    @user_posts = Post.where(user_id: @user.id).order(created_at: :desc)
    
    @user_shogo_firsts = ShogoFirst.where("id <= ?", max_shogo_first(@user))
    @user_shogo_lasts = ShogoLast.where("id <= ?", max_shogo_last(@user))
    
    shogo_ex_ids = get_shogo_ex(@user)
    @shogo_first_ex_list = ShogoFirstEx.where(id: shogo_ex_ids)
    @shogo_last_ex_list = ShogoLastEx.where(id: shogo_ex_ids)
  
    new_shogo_total = @user_shogo_firsts.count + @user_shogo_lasts.count + @shogo_first_ex_list.count + @shogo_last_ex_list.count

    if @user.shogo_total < new_shogo_total
      flash[:notice] = "新たな称号を獲得したぞ!!"
      @user.shogo_total = new_shogo_total
      @user.save
    end
  end
end
