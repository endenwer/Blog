class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
