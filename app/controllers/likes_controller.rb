class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(post_id: @post.id)
    like.save
    # この下の行は、正直あんまりいらないかも。ランキングが1つのいいねで更新されることはあまりないので
    @rank_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    @like_posts = Post.where(id: current_user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
  end

  def unlike
    like = current_user.likes.find_by(post_id: @post.id)
    like.destroy
    @rank_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    @like_posts = Post.where(id: current_user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
  end

  private

  def set_variables
    @post = Post.find(params[:post_id])
    @id_name = "#like-link-#{@post.id}"
  end
end
