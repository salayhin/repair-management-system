class AddColumnMobileNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile_no, :string
    add_index :users, :mobile_no, unique: true
  end
end
