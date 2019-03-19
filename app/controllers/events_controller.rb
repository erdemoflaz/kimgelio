class EventsController < ApplicationController
  before_action :set_events, only: %i[show edit update destroy]

  def index
    @events = Event.all.order(id: :desc)
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
    @invitations = @event.invitations
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'SİLİNDİ'
  end

  private
  def event_params
    params.require(:event).permit(:title, :description, :date, :location, :limit)
  end

  def set_events
    @event = Event.find(params[:id])
  end
end
