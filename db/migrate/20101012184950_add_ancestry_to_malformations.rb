class AddAncestryToMalformations < ActiveRecord::Migration
  def self.up
    add_column :malformations, :ancestry, :string
    add_index :malformations, :ancestry
  end

  def self.down
    remove_column :malformations, :ancestry
    remove_index :malformations, :ancestry
  end
end
