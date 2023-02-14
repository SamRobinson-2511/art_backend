class Review < ApplicationRecord
  belongs_to :viewer
  belongs_to :visit
  belongs_to :art
end
