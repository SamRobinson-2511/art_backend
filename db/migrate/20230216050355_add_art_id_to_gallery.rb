class AddArtIdToGallery < ActiveRecord::Migration[7.0]
  def change
    add_reference :galleries, :art, foreign_key: true
  end
end
