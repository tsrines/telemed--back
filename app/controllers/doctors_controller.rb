class DoctorsController < ApplicationController
  def index
    render json: Doctor.all
  end

  def show
    doctor = Doctor.find(params[:id])
    render json: doctor
  end

  def create
    @client = GooglePlaces::Client.new('YOUR_API_KEY')

    distance = params[:distance].to_i * 1609
    lat = params[:doctor][:lat].to_f
    lng = params[:doctor][:lng].to_f
    distance = '50000' if distance > 50_000

    spots =
      @client.spots(
        lat,
        lng,
        keyword: params[:query], types: 'doctor', radius: distance
      )

    docs = []
    detail_docs = []
    spots.each do |place|
      doctor_hash = {}

      doctor_hash['place_id'] = place['place_id']
      photo = place['photos'][0]

      doctor_hash['photo'] = photo.fetch_url(800) if photo

      doctor_hash['name'] = place['name']
      doctor_hash['formatted_address'] = place['formatted_address']
      doctor_hash['rating'] = place['rating']
      # doctor_hash['user_ratings_total'] = place['user_ratings_total']
      doctor_hash['formatted_phone_number'] = place['formatted_phone_number']
      doctor_hash['lat'] = place['lat']
      doctor_hash['lng'] = place['lng']
      doctor_hash['url'] = place['url']
      doctor_hash['website'] = place['website']

      doc =
        Doctor.find_or_create_by(
          place_id: doctor_hash[:place_id],
          formatted_address: doctor_hash[:formatted_address]
        )

      doc.update(doctor_hash)

      docs.push(doc)
    end
    docs.each do |doc|
      doctor_hash = {}
      #
      place = @client.spot(doc['place_id'])
      #
      # place = place.as_json
      doctor_hash['place_id'] = place['place_id']
      doctor_hash['name'] = place['name']
      doctor_hash['formatted_address'] = place['formatted_address']
      doctor_hash['rating'] = place['rating']
      # doctor_hash['user_ratings_total'] = place['user_ratings_total']
      doctor_hash['formatted_phone_number'] = place['formatted_phone_number']
      doctor_hash['lat'] = place['lat']
      doctor_hash['lng'] = place['lng']
      doctor_hash['url'] = place['url']
      doctor_hash['website'] = place['website']
      doc.update(doctor_hash)
      detail_docs.push(doc)
    end

    #
    # figure out if we can ensure duplicates don't enter,
    # as well as checking based on phone number, name, and address
    render json: detail_docs
  end
  # doctor = Doctor.find_by(place_id: params[:place_id])
  # if doctor
  #   render json: doctor
  # end
  # doctor = Doctor.new(doctor_params)
  # if doctor.save
  #   doctor.update(doctor_params)
  #   render json: doctor
  # else
  #   render json: {err: doctor.errors.full_messages}

  # end

  private

  def doctor_params
    params.require(:doctor).permit(
      :id,
      :place_id,
      :name,
      :photo,
      :formatted_address,
      :rating,
      :user_ratings_total,
      :formatted_phone_number,
      :lat,
      :lng,
      :url,
      :website,
      :distance,
      :query
    )
  end
end
