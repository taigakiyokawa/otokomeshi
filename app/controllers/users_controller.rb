class UsersController < ApplicationController
  before_action :authenticate_user!
<<<<<<< HEAD
  
=======
>>>>>>> 5559c2983039e1260a0c12b017e96a90f93a9559
  def index
    @users = User.all.order(created_at: :desc)
  end

  def show
    @user = User.find_by(id: params[:id])
    @shogo_first = ShogoFirst.find_by(user_id: params[:id])
    @shogo = Shogo.find_by(user_id: params[:id])
  end
end
