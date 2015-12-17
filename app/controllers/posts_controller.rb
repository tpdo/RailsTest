class PostsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  def index
  	@user = current_user
  	@posts = Post.all
  end

  def new
  end

  def create

  	post = Post.new(content: params[:content], user: User.find(current_user.id))
  	if post.valid?
  		post.save
  	else
  		flash[:errors] = post.errors.full_messages
  	end
		redirect_to "/posts/index"

  end

  def show
  	@post =Post.find(params[:id])
  	@likes = @post.likes
  end

  def destroy
  	post = Post.find(params[:id])
    post.delete
  	redirect_to "/posts/index"
  end

end
