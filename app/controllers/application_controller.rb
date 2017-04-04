class ApplicationController < ActionController::Base
  require 'open_weather'

  protect_from_forgery with: :exception
  before_action :news_index
  before_action :categories_index
  before_action :set_locale
  before_action :latest_announcements
  before_action :banners
  #before_action :set_weather

  def news_index
    @novelties_ = Novelty.order(created_at: :desc).all.take(25).shuffle
  end

  def categories_index
    @categories_ = Category.all
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def latest_announcements
    @latest_announcements = Announcement.order(created_at: :desc).limit(4).all
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

def weather
  weather = []
  options = { units: 'metric', APPID: 'd366877a830fd551c370e5686fcfb037' }
  weather_hash = OpenWeather::Current.city_id('710791', options)
  weather_hash['weather'].each do |key|
    weather << key['icon']
  end
  weather << weather_hash['main']['temp'].to_i
  weather
end

