class AddAdminRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :admin, index: true, foreign_key: true
  end
end
