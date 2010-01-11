class AddRegToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :reg, :boolean
  end

  def self.down
    remove_column :users, :reg
  end
end
