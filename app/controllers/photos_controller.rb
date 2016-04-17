class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    Photo.create(photo_params)
    redirect_to '/'
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
    # params.require(:photo).permit(:image)
  end
end
