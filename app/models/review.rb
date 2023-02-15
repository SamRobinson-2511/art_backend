class Review < ApplicationRecord
  belongs_to :viewer
  belongs_to :art
  belongs_to :visit

  validates :content, presence: true
  validates :rating, presence: true
end
