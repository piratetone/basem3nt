-- Passing Current User --

Within the create method of any controller, if you'd like to pass the current_user's information. 

  def create
		# This is the default line with a scaffold that needs to be replaced  
    # @game = Game.new(game_params)
   
   # This is the instance variable passing the current user. Use this!
    @game = current_user.games.build(game_params) 
end
---



			      v's bugs
----------------------------------------

- Bootstrap alert-errors 
	-- Fixing a bug where the alert error from an failed sign-in  wasn't taking any styling from the Bootstrap
			--- https://github.com/plataformatec/devise/wiki/How-To:-Integrate-I18n-Flash-Messages-with-Devise-and-Bootstrap


- Hiding tags with input fields 
	-- had to read the documatation well where the code was 
		--- https://github.com/bootstrap-ruby/rails-bootstrap-forms

- if server is in use, but nothing is running, run this command in the terminal to see what is using it
	-- sudo lsof -iTCP -sTCP:LISTEN -P | grep :3000
	-- https://teamtreehouse.com/forum/problem-starting-server


- adding a button to change a single attribute
	-- 	<% @games = User.find(current_user.id).games.pending.all %>
   	 	<% @games.each do |game| %>
	   	 	<strong> Against: <%= game.friend.gamertag %></strong><br>
			 Game: <%= game.id %><br>
			 Time:   <%= game.time.strftime("%a, %b %d @ %I:%M %p") %><br>
	 		 status: <%= game.status %>

	     	<%= bootstrap_form_for game,  method: :put do |f| %>
		    	<%= f.text_field :status, hide_label: "true", :type => "hidden", value: "approved" %>
		    	<%= f.submit "Approve", :class => "btn btn-info" %>
			<% end %>
			<hr> 
		<% end %>

- with the gamertag and getting a no method error
	-- when there saved games without friends, in a loop, Rails pulls up a blank and can't find the gamertag for it, causing it to crash




		

		