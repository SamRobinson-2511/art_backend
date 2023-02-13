class AddViewerIndexToGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :viewer_id, :integer
    add_index :galleries, :viewer_id
  end
end
