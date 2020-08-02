class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :photo_reference, :slug

  belongs_to :doctor
end
