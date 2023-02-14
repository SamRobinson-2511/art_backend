class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content, :rating
  has_one :viewer
  has_one :visit
  has_one :art
end
