class EventsController < ApplicationController

  def index
    @events = Event.by_date_of_event.where('start_date > ?', Time.now.beginning_of_day).paginate(page: params[:page], per_page: 20)
    @places = Place.all
    @event_categories = EventCategory.all

    respond_to do |format|
      format.html { render 'events/index', locals: { events: Event.all.by_date_of_event } }
      if params_valid?(params)
        format.json { render json: Event.by_date_of_event.get_month(params[:year], params[:month]), status: :ok }
      else
        format.json { render json: { data: 'Invalid parameters' }, status: :bad_request }
      end
    end

  end

  def show
    @event = Event.find(params[:id])
  end

  def place_id
    respond_to do |format|
      format.json {  render json: Event.by_date_of_event.where(place_id: params[:place_id]).all}
    end
  end

  def fetch_events_categories
    @events = []
    if params[:name] == 'all_events'
      @events = Event.by_date_of_event.where('start_date > ?', Time.now.beginning_of_day).paginate(page: params[:page], per_page: 20)
    else
      event_category = EventCategory.find_by_name(params[:name])
      Event.where(event_category_id: event_category.id).each do |event|
        @events << event
      end
    end

    @events

    respond_to do |format|
      format.js
    end
  end

  private

  def params_valid?(params)
    params[:year].present? && params[:month].present? && year_valid?(params[:year]) && month_valid?(params[:month])
  end

  def year_valid?(year)
    int_year = year.to_i
    int_year > 2000 && int_year < 2050
  end

  def month_valid?(month)
    int_month = month.to_i
    int_month >= 1 && int_month <= 12
  end
end
