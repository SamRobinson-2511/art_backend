class RemoveViewerIdFromGalleries < ActiveRecord::Migration[7.0]
  def change
    remove_column :galleries, :viewer_id, :integer
  end
end
