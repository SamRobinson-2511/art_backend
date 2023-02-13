class ChangeDateToString < ActiveRecord::Migration[7.0]
  def change
    change_column :visits, :date, :string
  end
end
