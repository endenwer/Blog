class CommentsController < ApplicationController

  def create
    if current_user
      @comment = current_user.comments.build(comment_params(true))
    else
      @comment = Comment.new(comment_params(false))
    end

    if @comment.save
      redirect_to post_path(@comment.post_id), success: 'Комментарий успешно добавлен!'
    else
      redirect_to post_path(@comment.post_id), danger: @comment.errors.full_messages
    end
  end

  private

  def comment_params(logined)
    if logined
      params.require(:comment).permit(:content, :post_id)
    else
      params.require(:comment).permit(:name, :email, :content, :post_id)
    end
  end
end
