class ShogosController < ApplicationController
  def create
    @shogo = current_user.shogo.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @shogo = Shogo.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @shogo = Shogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   

    def post_params
      params.require(:shogo).permit(:use_id, :status)
    end
end
