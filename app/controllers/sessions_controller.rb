class SessionsController < ApplicationController
	def new
  	end

	def create
    	user = User.find_by_postalcode(params[:session][:postalcode])
  		if user && user.authenticate(params[:session][:postalcode])
    		sign_in user
      		redirect_to user
  		else
    		flash[:error] = 'Invalid name/postalcode combination' 
      		render 'new'
  		end
  	end

  	def destroy
  		sign_out
    	redirect_to root_url
  	end
end
