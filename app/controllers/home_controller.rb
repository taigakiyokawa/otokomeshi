class HomeController < ApplicationController
  def top
    if user_signed_in? then
      redirect_to("/posts")
    end
  end
end
