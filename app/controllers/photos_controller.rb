class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @photos = Photo.all
  end

  def new
  end

  def create
    photo = Photo.create(photo_params)
    photo.user_id = current_user.id
    photo.save
    redirect_to '/'
  end

  def photo_params
    params.require(:photo).permit(:caption, :image)
    # params.require(:photo).permit(:image)
  end
end
