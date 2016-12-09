class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @announcements = @category.announcements.all
  end
end
