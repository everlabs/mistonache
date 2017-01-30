class MainController < ApplicationController

  def index
    @announcements = Announcement.order(visits: :desc).limit(4).all
  end

end
