class CreateFibres < ActiveRecord::Migration
  def change
    create_table :fibres do |t|
      t.float :latitude
      t.float :longitude
      t.string :f_color
      t.references :otdf, index: true, foreign_key: true
      t.integer :number_in_otdf
      t.string  :address
      
      t.timestamps null: false
    end
  end
end
