class VideosController < ApplicationController
  def index 
    @videos = Video.order(created_at: :desc)
  end

  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def video_params
    params.require(:video).permit(:title, :overview, :video).merge(user_id: current_user.id)
  end

end
