class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save!

    if @comment.save
      redirect_to post_path(@post.id)
    # else
    #   render :action => :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end
