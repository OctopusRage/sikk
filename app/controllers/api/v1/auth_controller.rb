class Api::V1::AuthController < ApplicationController
	def create
    email = params[:email]
    password = params[:password]
    user = Consumer.find_by(email: email)
    user = Consultant.find_by(email: email) if user.nil?
    if user.nil? 
    	render json: {
    		status: 'fail',
    		message: 'invalid email'
    	}
    else
	    if user.valid_password? password
	      sign_in user, store: false
	      user.save
	      render json: {
	      		status: 'success',
	      		data: user.as_credential.merge(user_type: user.class.name)
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
