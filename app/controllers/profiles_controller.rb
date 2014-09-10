class ProfilesController < ApplicationController

  def show
  	@user = User.find_by_email(params[:id])
   end
end
