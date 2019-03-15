class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @event = Event.find(params[:event_id])
    @invitation = current_user.invitation.new
    @invitation.update(status: 0, user_id: @current_user.id, event_id:@event.id)
    if @invitation.save
      redirect_back fallback_location: root_path
    end
  end

  private
  def invitations_params
    params.require(:invitation).permit(:event_id)
  end
end
