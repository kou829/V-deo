class VideosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

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

  def show
  end

  def edit
    unless current_user.id == @video.user.id
      redirect_to root_path
    end
  end

  def update
    if @video.update(video_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
    
  def destroy
    if current_user.id == @video.user_id
      @video.destroy
      redirect_to action: :index
    else
      render :edit
    end
  end


  private
  def video_params
    params.require(:video).permit(:title, :overview, :video).merge(user_id: current_user.id)
  end

  def set_video
    @video = Video.find(params[:id])
  end

end
