class WelcomeController < ApplicationController

  before_action :gallery
  before_action :banners

  def home
    @announcements = Announcement.main_feed
    @top_announcements = [ get_popular_announcement('Події і Ремарки'), get_popular_announcement('Цікаві місця Черкас'),
                      get_popular_announcement('Спалах минулого'), get_popular_announcement('Мальовнича Черкащина') ]
  end

  def history
  end

  def emblems
  end

  def video
  end

  def repertoir
    @repertoir = Repertoire.find(params[:id])
  end

  def pro_che
    @gallery = Gallery.limit(1).all[0]
  end

  def pro_go
    @announcements = Announcement.go_feed
    @people = Person.all.where.not(go_category_id: "")
    @teams = @people.group_by(&:go_category_id).sort
  end

  def person
    @person = Person.find(params[:id])
  end

  def kinoshot
    @announcements = Announcement.kinoshot_feed
    @people = Person.all.where.not(kinoshot_category_id: nil)
    @teams = @people.group_by(&:kinoshot_category_id).sort
  end

  def mat
    @announcements = Announcement.mat_feed
    @people = Person.all.where.not(mat_category_id: nil)
    @teams = @people.group_by(&:mat_category_id).sort
    @repertoiries = Repertoire.all
  end

  private

  def gallery
    @galleries = Gallery.all.order(popularity: :desc)
  end

  def banners
    banners = Banner.where.not(position: nil)
    @banners = {
        top: banners.find {|banner| banner.position == Banner::POSITION[:top]},
        bottom: banners.find {|banner| banner.position == Banner::POSITION[:bottom]},
        right: banners.find {|banner| banner.position == Banner::POSITION[:right]},
        right_second: banners.find {|banner| banner.position == Banner::POSITION[:right_second]},
        kinoshot: banners.by_kinoshot
    }
  end

  def get_popular_announcement(category_name)
    category_id = Category.find_by_name(category_name)&.id
    Announcement.where(category_id: category_id)

    most_viewed_by_month = {}
    Announcement.where(category_id: category_id).
        reject{ |an| an.announcement_views.where(created_at: (Time.new - 30.days) .. Time.now).empty? }.
        map{ |an| most_viewed_by_month[an] = an.announcement_views.count }

    most_viewed_by_month.max_by{|k,v| v} ? most_viewed_by_month.max_by{|k,v| v}[0] : Announcement.where(category_id: category_id).sort_by{|e| e[:visits]}.reverse.first
  end
end
