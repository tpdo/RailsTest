class SessionsController < ApplicationController
  def index
    render "sessions/index"
  end

  def create
  	user = User.find_by_email(params[:Email])
  	if user && user.authenticate(params[:Password])
  		session[:user_id] = user.id
      redirect_to"/posts/index"
  	else
  		flash[:errors] = "Invalid email or password"
  		redirect_to "/sessions/new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to "/sessions/new"
  end
end
