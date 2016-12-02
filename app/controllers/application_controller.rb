class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :news_index
  before_action :set_locale

  def news_index
    @novelties = Novelty.order(created_at: :desc).all.shuffle
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
