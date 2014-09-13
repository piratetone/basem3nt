-- Passing Current User --

Within the create method of any controller, if you'd like to pass the current_user's information. 

  def create
		# This is the default line with a scaffold that needs to be replaced  
    # @game = Game.new(game_params)
   
   # This is the instance variable passing the current user. Use this!
    @game = current_user.games.build(game_params) 
end
---





-- Fixing a bug where error wasn't taking any styling from the Bootstrap
		-- https://github.com/plataformatec/devise/wiki/How-To:-Integrate-I18n-Flash-Messages-with-Devise-and-Bootstrap