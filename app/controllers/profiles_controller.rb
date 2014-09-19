class ProfilesController < ApplicationController
  def show 
    @user = User.find_by_gamertag(params[:id])
  	if @user
		@games = @user.games.all  		
  		render action: :show  		
  	else
		# render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end