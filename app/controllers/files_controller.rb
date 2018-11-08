class FilesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # 現在のユーザの画像をアップデート
    @user = current_user
    if @user.update_attributes(user_img: params[:user_img])
      
    end
  end

  private
  def user_params
  end
end
