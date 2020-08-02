class DoctorSerializer < ActiveModel::Serializer
  attributes :id,
             :place_id,
             :name,
             :formatted_address,
             :rating,
             :user_ratings_total,
             :formatted_phone_number,
             :lat,
             :lng,
             :url,
             :photo,
             :website

  has_many :reviews
  has_many :photos
  has_many :favorites
  has_many :users, through: :favorites
end
