class HomeController < ApplicationController

	before_filter :authorize, only: [:edit, :update, :destroy]

	def index
		@blogs = Blog.all
	end

	def destroy
		@blog = Blog.find(params[:id])
	end

	def edit
		@blog = Blog.find(params[:id])
	end

end
