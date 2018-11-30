class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  include UsersHelper
  # GET /posts
  # GET /posts.json
  def index
    # 全投稿を新着順に表示(panel1)
    # @posts = Post.search(params[:search])
    # 全投稿を天晴数順にランキング(panel2)
    # post_like_count = Post.joins(:likes).group(:post_id).count
    # post_like_ids = Hash[post_like_count.sort_by{ |_, v| -v }].keys 
    # sub_posts = Post.where(id: post_like_ids).limit(10).index_by(&:id)
    # @rank_posts = post_like_ids.map {|id| sub_posts[id] }
    # @rank_posts = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
    # 天晴している投稿を取り出す(panel3)
    # @like_posts = Post.where(id: current_user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
    # @likes = Like.where(user_id: current_user.id).order(created_at: :desc)

    # posts/new をindexで表示するため
    @post = Post.new

    # # users/:id をindexで表示するため
    @user = User.find_by(id: current_user.id)
    @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
    @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
    @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)
    @user_posts = Post.where(user_id: @user.id).order(created_at: :desc)
    
    @tasks = Task.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def news
    @posts = Post.search(params[:search])
    @user = User.find_by(id: current_user.id)
    @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
    @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
    @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)
    render partial: 'posts/newIndex'
  end

  def rank
    post_like_count = Post.joins(:likes).group(:post_id).count
    post_like_ids = Hash[post_like_count.sort_by{ |_, v| -v }].keys 
    sub_posts = Post.where(id: post_like_ids).index_by(&:id)
    @rank_posts = post_like_ids.map {|id| sub_posts[id] }
    @user = User.find_by(id: current_user.id)
    @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
    @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
    @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)
    render partial: 'posts/rankIndex'
  end

  def appare
    @like_posts = Post.where(id: current_user.likes.map(&:post_id)).search(params[:search]).order(created_at: :desc)
    @user = User.find_by(id: current_user.id)
    @shogo_first = ShogoFirst.find_by(id: set_shogo_first(@user))
    @shogo_last = ShogoLast.find_by(id: set_shogo_last(@user))
    @shogo_first_ex = ShogoFirstEx.find_by(id: @user.shogo_first_ex_id)
    @shogo_last_ex = ShogoLastEx.find_by(id: @user.shogo_last_ex_id)
    render partial: 'posts/appareIndex'
  end

  def search
    
    render partial: 'posts/search_form'
  end
  # POST /posts
  # POST /posts.json
  def create
    # @post = Post.new(post_params)
    @tasks = Task.all
    @post = current_user.posts.build(post_params)

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

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
   

    def post_params
      params.require(:post).permit(:title, :meshim, {meshim: []}, :meshim_cache, :body, :task_id)
    end
end
