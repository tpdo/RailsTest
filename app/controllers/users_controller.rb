class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def create
  	user = User.new(
      name: params[:Name], 
      email: params[:Email], 
      password: params[:Password]
      )
  	if user.valid?
  		user.save
  		session[:user_id] = user.id
  		# redirect_to "/users/#{user.id}"
      redirect_to "/posts/index"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to "/sessions/new"
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(name: params[:Name], email: params[:Email])
  	redirect_to "/users/#{user.id}"
  end

  def destroy
  	user = User.find(params[:id])
  	user.delete
  	session[:user_id] = nil
  	redirect_to '/posts/index'
  end

end
