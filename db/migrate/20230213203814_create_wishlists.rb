class CreateWishlists < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlists do |t|
      t.belongs_to :viewer, null: false, foreign_key: true
      t.belongs_to :art, null: false, foreign_key: true

      t.timestamps
    end
  end
end
