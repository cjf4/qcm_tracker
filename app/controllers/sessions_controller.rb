class SessionsController < ApplicationController
	def new
	end	

	def create
		client = Client.find_by(email:params[:email].downcase)
		if client && client.authenticate(params[:password])
			sign_in client
			redirect_to client
		else
			#flash.now makes sure the flash isn't persistent
			flash.now[:error] = 'Invalid email/password combination'
			render :new
		end

	end

	def destroy
		sign_out
		redirect_to root_url
	end

	private

	def session_params
		params.require(:email, :password)
	end
end
