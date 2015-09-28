class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.js
    end
  end
end

