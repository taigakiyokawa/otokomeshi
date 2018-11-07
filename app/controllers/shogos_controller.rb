class ShogosController < ApplicationController

  def create
    # @post = Post.new(post_params)
    @shogo = current_user.posts.build(shogo_params)

    respond_to do |format|
      if @shogo.save
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
      if @shogo.update(shogo_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @shogo }
      else
        format.html { render :edit }
        format.json { render json: @shogo.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_likes_total
    x = 0
    @posts = Post.where(user_id: user.id)
    @posts.each do |post|
      x += post.likes.count
    end
    return x
  end

  helper_method :get_likes_total
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @shogo = Shogo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   

    def post_params
      params.require(:shogo).permit(:user_id, :status)
    end
  
end
