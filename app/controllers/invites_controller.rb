class InvitesController < ApplicationController
  
  def create
    @game = Game.find(params[:invite][:attended_event_id])
    current_user.attend!(@game)
    redirect_to @game
  end

  def destroy
    @game = Invite.find(params[:id]).attended_event
    current_user.cancel!(@game)
    redirect_to @game
  end

end
