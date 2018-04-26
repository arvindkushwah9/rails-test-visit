class UsersController < ApplicationController

  def index
  end

  def create
  	if params[:file].present?
	  	users = User.import(params[:file])
	  	@users = User.paginate(:page => params[:page], :per_page => 20)
	  else
	  	flash[:notice] = "Please select file."
	  	render 'welcome/index'
	  end
  end

end
