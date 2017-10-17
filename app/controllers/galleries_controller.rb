class GalleriesController < ApplicationController
  before_action :increase_popularity, only: :show

  def index
    @galleries = Gallery.paginate(page: params[:page], per_page: 15).order(updated_at: :desc)
  end

  def show
    @gallery = Gallery.find(params[:id])
    @announcements = Announcement.main_feed
  end


  private


  def increase_popularity
    Gallery.find(params[:id]).inc_popularity
  end
end
