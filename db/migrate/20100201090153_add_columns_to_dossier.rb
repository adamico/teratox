class AddColumnsToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :anomalie_echo, :boolean
    add_column :dossiers, :rciu, :boolean
  end

  def self.down
    remove_column :dossiers, :rciu
    remove_column :dossiers, :anomalie_echo
  end
end
