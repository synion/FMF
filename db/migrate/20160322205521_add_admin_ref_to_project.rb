class AddAdminRefToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :admin, index: true, foreign_key: true
  end
end
