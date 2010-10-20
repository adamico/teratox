class AddAncestryToPathologies < ActiveRecord::Migration
  def self.up
    add_column :pathologies, :ancestry, :string
    add_index :pathologies, :ancestry
  end

  def self.down
    remove_column :pathologies, :ancestry
    remove_index :pathologies, :ancestry
  end
end
