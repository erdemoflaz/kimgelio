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
  def show
    @event = Event.find(params[:id])
  end
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    end
  end
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to evebts_url, notice: 'SİLİNDİ'
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :limit)
  end
end
