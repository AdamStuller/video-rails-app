# require 'VideoWorker'


class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy, :add_subtitle]

  skip_before_action :require_user, only: [:index]

  def index
    @videos = Video.paginate(page: params[:page])
  end

  def show

  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # VideoWorker.perform_async(@video.id, "Halloc")

    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: 'Video was successfully destroyed.' }
    end
  end

  def add_subtitle
    @video.add_subtitle(params[:subtitle])
  end

  private

  def set_video
    @video = Video.find(params[:id])
    # VideoWorker.perform_async(@video.id, "Hallloc")

  end

  def video_params
    params.require(:video).permit(:name, :desc, :video_file, :thumbnail, :id , :subtitle, :page)
  end
end
