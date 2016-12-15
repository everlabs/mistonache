class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.order(visits: :desc).limit(4).all
  end

  def show
    @announcement = Announcement.find(params[:id])
    @announcement.update_attribute(:visits, @announcement.visits + 1)
  end

  def visits
    announcement = Announcement.find(params[:id])
    announcement.update_attribute(:visits, announcement.visits + 1)
  end

end
