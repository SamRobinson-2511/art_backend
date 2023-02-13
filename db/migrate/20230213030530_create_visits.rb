class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.integer :viewer_id
      t.integer :art_id
      t.date :date


      t.timestamps
    end
  end
end
