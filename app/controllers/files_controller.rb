class FilesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # 現在のユーザの画像をアップデート
    @user = current_user
    if @user.update_attributes(user_params)
      
    end
  end

  private
  def user_params
    params.permit(:x, :y, :width, :height, :user_img)
  end
end
