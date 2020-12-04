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

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
    unless current_user.id == @video.user.id
      redirect_to root_path
    end
  end

  def update
    @video = Video.find(params[:id])
    if @video.update(video_params)
      redirect_to action: :show
    else
      render :edit
    end
  end
    
  def destroy
    @video = Video.find(params[:id])
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

end
