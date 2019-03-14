class EventsController < ApplicationController
  def index
    render inline: 'events listing'
  end
end