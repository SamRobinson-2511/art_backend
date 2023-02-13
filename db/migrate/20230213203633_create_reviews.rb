class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :viewer, null: false, foreign_key: true
      t.belongs_to :art, null: false, foreign_key: true
      t.belongs_to :visit, null: false, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
