class Api::V1::Admins::SessionsController < ApplicationController
	def create
		password = params[:password]
    email = params[:email]
    user = Admin.find_by(email:params[:email])
    if !user.present? 
    	render json: {
    		status: 'fail',
    		message: 'invalid username or password'
    	}, status: 422
    else
	    if user.valid_password? password
	      sign_in user, store: false
	      user.save
	      render json: {
	      		status: 'success',
	      		data: user
	      	}, status: 200
	    else
	      render json: { 
	      	status: 'fail',
	      	message: 'invalid username or password'
	      }, status: 422
	    end
	  end
	end	
end
		