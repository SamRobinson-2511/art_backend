class Gallery < ApplicationRecord
  has_many :arts
  belongs_to :viewer
end
