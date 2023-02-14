class Visit < ApplicationRecord
    belongs_to :viewer
    has_many :reviews
    has_many :arts, through: :reviews
end
