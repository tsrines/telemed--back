class SearchSerializer < ActiveModel::Serializer
  attributes :id, :csv
  belongs_to :user
end
