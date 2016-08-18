class BlogsController < ApplicationController

	before_filter :authenticate_user!


	def index

		@blogs = current_user.blogs

	end

	def show

		@blog = Blog.find(params[:id])
		@comments = @blog.comments

	end

	def new
		@blog = Blog.new
	end

	def create

		@blog = current_user.blogs.create(blog_params)
  	@blog.save
		flash.notice = "Blog '#{@blog.title}' Created Successfully!"
  	redirect_to blog_path(@blog)

	end

	def edit
  	@blog = Blog.find(params[:id])
  	@comment = Comment.new
		@comment.blog_id = @blog.id
	end

	def update
	  @blog = Blog.find(params[:id])
	  @blog.update(blog_params)
    flash.notice = "Blog '#{@blog.title}' Updated Successfully!"
	  redirect_to blog_path(@blog)
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		flash.notice = "Blog '#{@blog.title}' Deleted Successfully!"
		redirect_to blogs_path
	end

	private

	def blog_params
  	params.require(:blog).permit(:title, :body)
	end

end
