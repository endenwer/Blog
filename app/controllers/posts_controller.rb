class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user ? current_user.comments.build : User.first.comments.build
  end
end
