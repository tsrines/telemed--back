class Review < ApplicationRecord
  # validates :text, uniqueness: true
  belongs_to :doctor
end
