class WelcomeController < ApplicationController

  before_action :gallery
  before_action :banners

  def home
    @announcements = Announcement.main_feed

  end

  def history
  end

  def emblems
  end

  def pro_che
  end

  def pro_go
    @announcements = Announcement.go_feed
    @people = Person.all
    @teams = @people.group_by(&:person_category_id).sort
  end

  def person
    @person = Person.find(params[:id])
  end

  def kinoshot
    @announcements = Announcement.kinoshot_feed
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
