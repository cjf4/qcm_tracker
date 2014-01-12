class StaticPagesController < ApplicationController

	def home
		signed_in_homepage
	end

end
