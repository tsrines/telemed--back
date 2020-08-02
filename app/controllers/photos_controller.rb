class PhotosController < ApplicationController
  def index
    photos = Photo.all
    render json: photos
  end

  def create
    @client = GooglePlaces::Client.new('YOUR_API_KEY')

    @spot = @client.spot(params[:doctor_reference])

    allPhotos = []
    @spot.photos.each do |photo|
      newPhoto = Photo.new(photo_params)
      newPhoto.update(slug: photo.fetch_url(800)) if newPhoto.save!
      allPhotos.push(newPhoto)
    end
    if allPhotos
      render json: allPhotos
    else
      render json: { msg: 'No photos' }
    end
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end

  private

  def photo_params
    params.require(:photo).permit(:doctor_id, :doctor_reference, :slug)
  end
end
