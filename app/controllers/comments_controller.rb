class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      puts "COMMENT SAVED"
    else
      puts "OOOOPS"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :commentable_type, :commentable_id)
  end
end
