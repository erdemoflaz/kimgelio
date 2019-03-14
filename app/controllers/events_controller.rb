class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :limit)
  end
end
