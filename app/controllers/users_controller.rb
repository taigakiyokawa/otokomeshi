class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @shogo_first = ShogoFirst.find_by(user_id: params[:id])
    @shogo = Shogo.find_by(user_id: params[:id])
  end
end
