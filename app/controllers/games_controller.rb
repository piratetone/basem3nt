class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def index
    @games = Game.all
  end

  def show
    @game = Game.find_by(params[:id])
  end

  def new
#    @game = Game.new
     @game = current_user.games.build
  end

  def edit
  end

  def status
    @games = Game.all
  end


  def create
     @friend = User.where(gamertag: params[:game][:friend_id]).first
     @user_game = Game.request(current_user, @friend)
     @game = current_user.games.build(game_params) 
       
        if params[:game] && params[:game].has_key?(:friend_id) && 
          @game.save
          respond_to do |format|
            format.html do
              flash[:success] = "Game request sent to #{@friend.email}."
              redirect_to profile_path(@friend)
            end 
            format.json { render json: @game.to_json }       
           end
         end

      

    end

    # respond_to do |format|
    #   if @game.save
    #     format.html { redirect_to @game, notice: 'Game was successfully created.' }
    #     format.json { render :show, status: :created, location: @game }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @game.errors, status: :unprocessable_entity }
    #   end
    # end
  # end

  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def accept
    if @game.accept!
      flash[:success] = "You are now friends with #{@game.friend.first_name}"
    else
      flash[:success] = "That friendship could not be accepted"
    end
    redirect_to user_friendships_path
  end

  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:time, :user_id, :gamer, :gamertag, :friend_id, {id:[]})
    end
end



