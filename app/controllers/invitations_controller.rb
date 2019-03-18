class InvitationsController < ApplicationController
before_action :set_events
before_action :set_invitation, only: %i[accept decline]
before_action :protect, only: %i[accept decline]
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = current_user.invitations.new
    @invitation.update(status: 0, user_id: @current_user.id, event_id:@event.id)
    if @invitation.save
      redirect_back fallback_location: root_path
    end
  end

  def accept
    if @invitation.update(status: 1)
      redirect_back fallback_location: root_path
    end
  end

  def decline
    if @invitation.update(status: 2)
      redirect_back fallback_location: root_path
    end
  end

  private
  def invitations_params
    params.require(:invitation).permit(:event_id)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def set_events
    @event = Event.find(params[:event_id])
  end

  def protect
    if @current_user != @event.user
     redirect_back fallback_location: root_path
    end
  end
end
