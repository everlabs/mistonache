class WelcomeController < ApplicationController

  before_action :gallery
  before_action :banners

  def home
    @announcements = Announcement.order(visits: :desc).limit(4).all
  end

  def pro_che
    
  end

  private

  def gallery
    @gallery = Gallery.limit(1).all[0]
  end

  def banners
    banners = Banner.where.not(position: nil)
    @banners = {
        top: banners.find {|banner| banner.position == Banner::POSITION[:top]},
        bottom: banners.find {|banner| banner.position == Banner::POSITION[:bottom]},
        right: banners.find {|banner| banner.position == Banner::POSITION[:right]}
    }
  end
end
