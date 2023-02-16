class AddVisitsFkToArts < ActiveRecord::Migration[7.0]
  def change
    add_reference :arts, :visit, foreign_key: true
  end
end
