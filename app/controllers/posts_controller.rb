class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.includes(:user).all.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :action => :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.where(parent_id: nil).includes(:user)
  def upvote
    if current_user.upvoted?(@post)
      current_user.votes.find_by(post: @post).destroy
      @vote = nil
    else
      @vote = @post.votes.new(user: current_user)
      @vote.save
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :link_url, :content)
  end
end
