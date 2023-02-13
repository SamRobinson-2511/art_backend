class AddViewerIdIndexToVisits < ActiveRecord::Migration[7.0]
  def change
    add_index :visits, :viewer_id
  end
end
