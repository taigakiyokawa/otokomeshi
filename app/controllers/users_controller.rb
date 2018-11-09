class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    # @shogo_first = Shogo_first.where('user_id = @user.id')
    # @shogo = Shogo.where('user_id = @user.id').limit(1)
  end
end
