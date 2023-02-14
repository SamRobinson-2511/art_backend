class ViewerSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :password, :zip_code

  has_many :visits
  has_many :arts, through: :visits
  
end
