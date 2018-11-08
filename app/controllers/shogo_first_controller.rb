class ShogoFirstController < ApplicationController
  def create
    # @post = Post.new(post_params)
    @shogo_first = current_user.posts.build(shogo_first_params)

    respond_to do |format|
      if @shogo_first.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @shogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @shogo_first.update(shogo_first_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @shogo }
      else
        format.html { render :edit }
        format.json { render json: @shogo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @shogo_first = Shogo_first.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   
    def post_params
      params.require(:shogo_first).permit(:user_id, :status, :shogo_first_name)
    end
end
