class AnnouncementsController < ApplicationController

  def index
    @announcements = Announcement.paginate(:page => params[:page], :per_page => 3)
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
