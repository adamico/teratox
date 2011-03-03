class AddPathologiesIndex < ActiveRecord::Migration
  def self.up
    add_index :pathologies, :parent_id
  end

  def self.down
    remove_index :pathologies, :column => :parent_id
  end
end
