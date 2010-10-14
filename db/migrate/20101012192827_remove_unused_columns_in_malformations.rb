class RemoveUnusedColumnsInMalformations < ActiveRecord::Migration
  def self.up
    remove_column :malformations, :code_terme
    remove_column :malformations, :code_terme_pere
  end

  def self.down
    add_column :malformations, :code_terme_pere, :integer
    add_column :malformations, :code_terme, :integer
  end
end
