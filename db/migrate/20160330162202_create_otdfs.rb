class CreateOtdfs < ActiveRecord::Migration
  def change
    create_table :otdfs do |t|
      t.string :type
      t.string :direct
      t.references :switchgear_fiber, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
