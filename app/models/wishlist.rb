class Wishlist < ApplicationRecord
  belongs_to :viewer
  belongs_to :art
end
