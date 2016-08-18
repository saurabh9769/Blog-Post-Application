class CommentsController < ApplicationController


	def index

	end

	def new
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build
	  respond_to do |format|
      format.js
    end
  end

	def create
	  @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.create(comment_params)
    @comment.user = User.find(current_user.id)
  	@comment.save
	  respond_to do |format|
      format.js
    end
	end

	def edit
		@comment = Comment.find(params[:id])
		@blog = Blog.find(params[:blog_id])
		respond_to do |format|
  		format.js { render "edit", :locals => {:id => params[:id]} }
  	end
	end

	def update
		@blog = Blog.find(params[:blog_id])
		@comment = Comment.find(params[:id])
	  @comment.update_attributes(comment_params)
  	respond_to do |format|
  		format.js { render "update", :locals => {:id => params[:id]} }
    end
	end

	def show
    @comment = Comment.find(params[:id])
	end

	def destroy
		# binding.pry
		@comment = Comment.find(params[:id])
	  @blog = @comment.blog
		@comment.destroy
		respond_to do |format|
      format.js   { render :layout => false }
    end
	end

	protected

	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end

end
