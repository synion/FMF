class CreateSwitchgears < ActiveRecord::Migration
  def change
    create_table :switchgears do |t|
      t.integer :project_id
      t.text :description

      t.timestamps null: false
    end
  end
end
