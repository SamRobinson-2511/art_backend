class Visit < ApplicationRecord
    validates :viewer_id, :art_id, :date, presence: true
    
end
