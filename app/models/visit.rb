class Visit < ApplicationRecord
    validates :viewer_id, :art_id, :date, presence: true

    def viewer 
        Viewer.find_by(id: self.viewer_id)
    end

    def art
        Art.find_by(id: self.art_id)
    end
    
end
