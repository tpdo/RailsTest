class LikesController < ApplicationController
before_action :require_login, only: [:create, :destroy]
  def create
  	Like.create(post_id: params[:post_id], user_id: current_user.id)
  	redirect_to "/posts/index"
  end

  def destroy
  	like = Like.find_by(user: current_user.id, post: params[:post_id])
  	like.delete
  	redirect_to "/posts/index"
  end
end
