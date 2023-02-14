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
  validates :password_digest, presence: true, on: create, format: PASSWORD_REQUIREMENTS
  validates :zip_code, presence: true, on: create
  
  has_many :visits
  has_many :reviews, through: :visits
  
  has_many :galleries
  
  has_many :wishlists
  has_many :arts, through: :wishlists

  def reviewed_art
    reviews.map(&:art)
  end

  def wishlisted_art
    wishlists.map(&:art)
  end
  
  def index
    render json: Viewer.all, status: :ok
  end

  def show
    viewer = Viewer.find(params[:id])
    render json: viewer, status: :ok
  end
  
  def create
    viewer = Viewer.create!(viewer_params)
    render json: viewer, status: :ok
  end

  private

  def viewer_params
    params.require(:viewer).permit(:first_name, :last_name, :email, :password_digest, :zip_code)
  end
end
