class RemoveUnusedColumnsInMalformations < ActiveRecord::Migration
  def self.up
    remove_column :malformations, :code_terme
    remove_column :malformations, :code_terme_pere
    remove_column :malformations, :parent_id
  end

  def self.down
    add_column :malformations, :parent_id
    add_column :malformations, :code_terme_pere
    add_column :malformations, :code_terme
  end
end
