class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @announcements = @category.announcements.all
    @side_announcements = Announcement.announcements_feed.last(5)
  end

  def index
    @categories = Category.all
  end

end
