class AddIndexesToExpositions < ActiveRecord::Migration
  def self.up
    add_index :expositions, [:dossier_id, :produit_id, :terme_id, :niveau_id]
  end

  def self.down
    remove_index :expositions, :column => [:dossier_id, :produit_id, :terme_id, :niveau_id]
  end
end
