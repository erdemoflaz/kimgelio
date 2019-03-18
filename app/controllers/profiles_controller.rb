class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = @user.events
    @acceptedEvents = Event.where(id: @user.invitations.accepted.collect(&:event_id))
  end
end
