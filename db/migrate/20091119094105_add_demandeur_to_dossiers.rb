class AddDemandeurToDossiers < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :demandeur_id, :integer
  end

  def self.down
    remove_column :dossiers, :demandeur_id
  end
end
