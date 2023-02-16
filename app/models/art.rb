class Art < ApplicationRecord
  belongs_to :gallery
  
  has_many :visits, dependent: :destroy
  has_many :viewers, through: :visits

  has_many :reviews, dependent: :destroy
  has_many :viewers, through: :reviews
  
end
