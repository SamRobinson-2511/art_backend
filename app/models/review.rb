class Review < ApplicationRecord
  belongs_to :viewer
  belongs_to :art
  belongs_to :visit
end
