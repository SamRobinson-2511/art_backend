class ChangeUserToViewerGalleries < ActiveRecord::Migration[7.0]
  def change
    rename_column :galleries, :user_id, :viewer_id
  end
end
