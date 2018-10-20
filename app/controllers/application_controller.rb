class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        posts_path
    end
      
    def defore_sign_out_path_for(resource)
        root_path
    end
end
