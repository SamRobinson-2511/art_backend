class WishlistSerializer < ActiveModel::Serializer
  attributes :id
  has_one :viewer
  has_one :art
end
