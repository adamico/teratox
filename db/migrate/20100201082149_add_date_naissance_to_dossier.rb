class AddDateNaissanceToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :date_naissance, :date
  end

  def self.down
    remove_column :dossiers, :date_naissance
  end
end
