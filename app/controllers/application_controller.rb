class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        posts_path
    end
      
    def defore_sign_out_path_for(resource)
        root_path
    end

    before_action :configure_permitted_parameters, if: :devise_controller?

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up){|u|
            u.permit(:username, :email, :user_img, :password, :password_confirmation)
        }

        devise_parameter_sanitizer.permit(:sign_in){|u|
            u.permit(:username, :email, :password, :user_img, :remember_me)
        }

        devise_parameter_sanitizer.permit(:account_update){|u|
            u.permit(:username, :email, :user_img, :password, :password_confirmation, :current_password)
        }
    end
end
