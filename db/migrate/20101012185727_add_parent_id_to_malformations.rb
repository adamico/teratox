class AddParentIdToMalformations < ActiveRecord::Migration
  def self.up
    add_column :malformations, :parent_id, :integer
  end

  def self.down
    remove_column :malformations, :parent_id
  end
end
