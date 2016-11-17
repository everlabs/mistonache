class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action 'news_index'

  def news_index
    @novelties = Novelty.all
  end
end
