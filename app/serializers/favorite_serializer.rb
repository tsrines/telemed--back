class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :user_id
  belongs_to :user
  belongs_to :doctor
end
