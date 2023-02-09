class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  before_action :set_post, :only => [:show, :edit, :update, :destroy, :upvote]

  def index
    @posts = Post.includes(:user)
                 .all
                 .order("score DESC")
                 .page(params[:page])
                 .per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = "post was successfully created"
    else
      flash[:alert] = "post was failed to create"
      render :action => :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
      flash[:notice] = "post was successfully updated"
    else
      flash[:alert] = "post was failed to update"
      render :action => :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.where(parent_id: nil).includes(:user).order("score DESC")
    @vote = @post.votes.find_by(user: current_user)
  end

  def destroy
    @post.destroy

    flash[:notice] = "post was destroy successfully"
    redirect_to root_path
  end

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

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link_url, :content)
  end
end
