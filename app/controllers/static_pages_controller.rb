class StaticPagesController < ApplicationController

	before_action :authenticate_user!
	
  def about
  end

  def contact
  end
  
end
