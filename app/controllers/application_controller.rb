class ApplicationController < ActionController::Base
  require 'open_weather'

  protect_from_forgery with: :exception
  before_action :news_index
  before_action :set_locale
  before_action :set_weather

  def news_index
    @novelties_ = Novelty.order(created_at: :desc).all.take(15).shuffle
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

def set_weather
  weather = []
  options = { units: 'metric', APPID: 'd366877a830fd551c370e5686fcfb037' }
  weather_hash = OpenWeather::Current.city_id('710791', options)
  weather_hash['weather'].each do |key|
    weather << key['icon']
  end
  weather_hash['main'].each do |key, value|
    #value.map{|values| values.to_s}
    #weather << key['temp']
    puts value.to_s
  end
  weather
end
