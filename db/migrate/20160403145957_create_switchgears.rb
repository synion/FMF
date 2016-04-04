class CreateSwitchgears < ActiveRecord::Migration
  def change
    create_table :switchgears do |t|
      t.references :project, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
