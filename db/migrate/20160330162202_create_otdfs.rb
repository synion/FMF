class CreateOtdfs < ActiveRecord::Migration
  def change
    create_table :otdfs do |t|
      t.integer :size
      t.string :direct
      t.references :switchgear, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
