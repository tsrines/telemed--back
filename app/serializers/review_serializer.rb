class ReviewSerializer < ActiveModel::Serializer
  attributes :id,
             :doctor_id,
             :place_id,
             :author_name,
             :author_url,
             :profile_photo_url,
             :rating,
             :relative_time_description,
             :text,
             :time
end
