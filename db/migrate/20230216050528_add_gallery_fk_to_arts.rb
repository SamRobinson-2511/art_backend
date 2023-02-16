class AddGalleryFkToArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :gallery, foreign_key: true
  end
end
