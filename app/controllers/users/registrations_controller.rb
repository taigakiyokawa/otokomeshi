# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  include UsersHelper
  # GET /resource/sign_up
  # def new
  #   super do
  # end

  # POST /resource
  def create
    super do |resource|
      # custom code
    end
  end

  # GET /resource/edit
  def edit

    @shogo_first = ShogoFirst.find(set_shogo_first(current_user))
    @shogo_last = ShogoLast.find(set_shogo_last(current_user))
    @shogo_first_ex = ShogoFirstEx.find_by(id: current_user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: current_user.shogo_last_ex_id)
    shogo_ex_ids = get_shogo_ex(current_user)
    @shogo_first_ex_list = ShogoFirstEx.where(id: shogo_ex_ids)
    @shogo_last_ex_list = ShogoLastEx.where(id: shogo_ex_ids)
    
  
  end

  # PUT /resource
  def update
    if update_params[:password].blank?
      current_user.update!(
        {username: update_params[:username],
        user_img: update_params[:user_img],
        shogo_first_ex_id: update_params[:shogo_first_ex_id],
        shogo_last_ex_id: update_params[:shogo_last_ex_id],
        shogo_first_ex_flag: update_params[:shogo_first_ex_flag],
        shogo_last_ex_flag: update_params[:shogo_last_ex_flag],
      })
    else
      current_user.update!({
        username: update_params[:username],
        user_img: update_params[:user_img],
        password: update_params[:password],
        shogo_first_ex_id: update_params[:shogo_first_ex_id],
        shogo_last_ex_id: update_params[:shogo_last_ex_id],
        shogo_first_ex_flag: update_params[:shogo_first_ex_flag],
        shogo_last_ex_flag: update_params[:shogo_last_ex_flag],
      })
    end
    redirect_to posts_path
    sign_in(current_user, bypass: true)
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  # protected
  #   def update_resource(resource, params)
  #     resource.update_without_current_password(params)
  #     resource.update_without_password(params)
  #   end
  
  private
    def update_params
      params.require(:user).permit(%i(username user_img password shogo_first_ex_id))
    end
end
