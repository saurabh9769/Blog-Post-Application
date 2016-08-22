class HomeController < ApplicationController

	before_filter :authorize, only: [:edit, :update, :destroy]
	# load_and_authorize_resource

	def index
		@blogs = Blog.all
		@banner = Banner.all
		# @banner = Banner.find(params[:id])
	end

	def destroy
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def show
		@banner = Banner.find(params[:id])
	end

end
