class AddIncludedToDossiers < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :included, :integer, :default => 0
  end

  def self.down
    remove_column :dossiers, :included
  end
end
