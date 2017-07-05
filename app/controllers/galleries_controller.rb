class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
  end

  def show
    @gallery = Gallery.find(params[:id])
    @announcements = Announcement.main_feed
  end

end
