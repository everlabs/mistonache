class AnnouncementsController < ApplicationController

  before_action :put_announcements, only: [:show]

  def index
    if params[:search]
      @announcements = Announcement.where('title LIKE ?', "%#{params[:search]}%").announcements_feed.paginate(page: params[:page], per_page: 3)
    else
      @announcements = Announcement.announcements_feed.paginate(page: params[:page], per_page: 3)
    end
  end

  def show
    @announcement = Announcement.find(params[:id])
    @announcement.update_attribute(:visits, @announcement.visits + 1)
    @go_announcements = Announcement.go_feed.paginate(page: params[:page], per_page: 3)

  end

  def go_announcements
    @announcements = Announcement.go_feed.paginate(page: params[:page], per_page: 3)
  end

  def visits
    announcement = Announcement.find(params[:id])
    announcement.update_attribute(:visits, announcement.visits + 1)
  end

  private

  def put_announcements
    @announcements = Announcement.announcements_feed.paginate(page: params[:page], per_page: 3)
  end
end
