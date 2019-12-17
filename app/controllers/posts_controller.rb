class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		#binding.pry
		@post = Post.new(params.require(:post).permit(:title, :description))
		#@post.author
    if @post.save
      redirect_to posts_path(@post)
    else
      render :new
    end
	end

	def update
		#binding.pry
	  @post = Post.find(params[:id])
		@post.update(params.require(:post).permit(:title, :description, :post_status, :author_id))
		@post.save 
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
end
