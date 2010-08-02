class AddIndexesToDossiers < ActiveRecord::Migration
  def self.up
    add_index :dossiers, [:expo_type, :acctype_id, :correspondant_id, :profession_id, :accmod_id, :niveau_id, :cat_id, :demandeur_id]
  end

  def self.down
    remove_index :dossiers, :column => [:expo_type, :acctype_id, :correspondant_id, :profession_id, :accmod_id, :niveau_id, :cat_id, :demandeur_id]
  end
end
