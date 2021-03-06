class ProfilesController < ApplicationController
  def show
  	@user = User.find_by_handle(params[:handle])

  	if @user
  		@links = @user.links.all
  		render :show
  	else
  		redirect_to root_path, :flash => { :error => "That user does not exist" } 
  	end
  end
end
