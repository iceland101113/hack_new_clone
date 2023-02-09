class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to post_path(@post.id)
      flash[:notice] = "comment was successfully create"
    else
      flash.now[:alert] = "comment was failed to create"
      render :action => :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
