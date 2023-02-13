class Art < ApplicationRecord
  has_many :visits
  has_many :viewers, through: :visits
  has_many :reviews
  has_many :reviews, through: :visits
end
