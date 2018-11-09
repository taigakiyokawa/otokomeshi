class LikesController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @like = Like.create(user_id: current_user.id, post_id: @post.id)
      @like_hash ={}
      @like_hash[@post.id] = @post.id
  
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def destroy
      @post = Post.find(params[:post_id])
      like = Like.find_by(user_id: current_user.id, post_id:@post.id)
      like.destroy
      @like_hash ={}
  
      respond_to do |format|
        format.html
        format.js
      end
     end
   end