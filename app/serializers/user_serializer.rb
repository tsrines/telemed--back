class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :email,
             :first_name,
             :last_name,
             :password,
             :password_confirmation,
             :address

  has_many :favorites
  has_many :searches
  has_many :doctors, through: :favorites
end
