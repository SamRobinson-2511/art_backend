class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating
  has_one :viewer
  has_one :art
  has_one :visit
end
