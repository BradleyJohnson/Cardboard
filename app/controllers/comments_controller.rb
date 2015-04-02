class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: {
        comment: @comment,
        user: @comment.user
      }
    else
      render json: @comment.errors.messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :commentable_type, :commentable_id, :user_id)
  end
end
