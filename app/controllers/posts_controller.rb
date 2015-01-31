class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = current_user ? current_user.comments.build : Comment.build
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(current_user), success: 'Пост успешно создан!'
    else
      redirect_to new_post_path, error: @post.errors.full_messages
    end
  end

  def edit

  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

end
