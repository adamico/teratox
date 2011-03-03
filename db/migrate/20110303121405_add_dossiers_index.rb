class AddDossiersIndex < ActiveRecord::Migration
  def self.up
    add_index :dossiers, :expo_type
  end

  def self.down
    remove_index :dossiers, :column => :expo_type
  end
end
