class RemoveUnusedColumnsInPathologies < ActiveRecord::Migration
  def self.up
    remove_column :pathologies, :code_terme
    remove_column :pathologies, :code_terme_pere
  end

  def self.down
    add_column :pathologies, :code_terme_pere, :integer
    add_column :pathologies, :code_terme, :integer
  end
end
