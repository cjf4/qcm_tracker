class ClientsController < ApplicationController
	before_action :signed_in_client, 	only: [:edit, :update]
	before_action :correct_client,		only: [:edit, :update]

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			flash[:success] = "New client successfully created"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
		@client = Client.find(params[:id])
	end

	def edit
	end

	def update
		@client = Client.find(params[:id])
		if @client.update_attributes(client_params)
			flash[:success] = "Changes saved!"
			redirect_to @client
		else
			render 'edit'
		end
	end

	private

	def client_params
		params.require(:client).permit(:username, :email, :company, :password, 
																		:password_confirmation)
	end

	#before filters

	def signed_in_client
		unless signed_in?
			store_location
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end
	end

	def correct_client
		@client = Client.find(params[:id])
		redirect_to(root_url) unless current_client?(@client)
	end
end
