class FavoritesController < ApplicationController
  before_action :require_user_logged_in  
  
  def index
    @user = current_user
    @likes = current_user.likes.order('created_at DESC').page(params[:page])
  end

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like(micropost)
    flash[:success] = 'コメントをいいね！しました。'
    redirect_back(fallback_location: root_url)
    
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike(micropost)
    flash[:success] = 'コメントのいいね！を解除しました。'
    redirect_back(fallback_location: root_url)
  end
end
