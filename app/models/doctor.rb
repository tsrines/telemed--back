class Doctor < ApplicationRecord
  # validates :place_id, uniqueness: true
  has_many :favorites, dependent: :destroy
  has_many :photos, dependent: :destroy

  has_many :reviews, dependent: :destroy

  has_many :users, through: :favorites
end
