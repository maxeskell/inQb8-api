class ChangeColumnName < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :users, :facbook_id, :facebook_id
  end

  def self.down
    rename_column :users, :facebook_id, :facbook_id
  end
end
