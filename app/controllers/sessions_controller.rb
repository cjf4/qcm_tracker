class SessionsController < ApplicationController
	def new
	end	

	def create
		client = Client.find_by(email:params[:session][:email].downcase)
		if client && client.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			#flash.now makes sure the flash isn't persistent
			flash.now[:error] = 'Invalid email/password combination'
			render :new
		end

	end

	def destroy
	end

	private

	def session_params
		params.require(:email, :password)
	end
end
