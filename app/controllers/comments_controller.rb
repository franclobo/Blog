class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    permitted = params.require(:comment).permit(:text)
    @comment = Comment.new(text: permitted[:text], author_id: current_user.id, post_id: params[:post_id])
    if @comment.save
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      render :new
    end
  end
end
