class CreateViewers < ActiveRecord::Migration[7.0]
  def change
    create_table :viewers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :zip_code
    
      

      t.timestamps
    end
  end
end
