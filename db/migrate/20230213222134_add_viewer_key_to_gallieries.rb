class AddViewerKeyToGallieries < ActiveRecord::Migration[7.0]
  def change
    add_index :galleries, :viewer_id
  end
end
