class Art < ApplicationRecord
  has_many :visits, dependent: :destroy
  has_many :viewers, through: :visits
  has_many :reviews, dependent: :destroy
  has_many :reviews, through: :visits
end
