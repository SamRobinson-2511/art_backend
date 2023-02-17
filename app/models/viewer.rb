class Viewer < ApplicationRecord # rubocop:disable Style/FrozenStringLiteralComment
  
  has_secure_password
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true, length: { in: 2..12 }
  validates :last_name, presence: true, length: { in: 2..25 }
  PASSWORD_REQUIREMENTS = /\A
    (?=.{8,}) #at least 8 characters long
    (?=.*\d) #contains at lease one digit
    (?=.*[a-z]) #contains at least one lowercase letter
    (?=.*[A-Z]) #contains at least one uppercase letter
    (?=.*[[:^alnum:]]) #contains at least one symbol
    /x
  validates :password, presence: true, on: create, format: PASSWORD_REQUIREMENTS  
  validates :zip_code, presence: true
  
  has_many :galleries
  has_many :wishlists
  has_many :arts, through: :wishlists
  has_many :visits
  has_many :reviews, through: :visits
  
end


