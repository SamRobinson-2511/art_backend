class AddBelongsToUserGalleries < ActiveRecord::Migration[7.0]
  def change
    add_column :galleries, :user_id, :integer
  end
end
