class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.order(created_at: :desc).all
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

end
