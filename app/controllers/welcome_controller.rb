class WelcomeController < ApplicationController
  def home
    @announcements = Announcement.order(visits: :desc).limit(4).all
  end
end
