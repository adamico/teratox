class AddIndexesToDossier < ActiveRecord::Migration
  def self.up
    add_index 'dossiers', 'acctype_id'
    add_index 'dossiers', 'correspondant_id'
    add_index 'dossiers', 'profession_id'
    add_index 'dossiers', 'accmod_id'
    add_index 'dossiers', 'niveau_id'
    add_index 'dossiers', 'cat_id'
    add_index 'dossiers', 'demandeur_id'
  end

  def self.down
    remove_index 'dossiers', :column => 'demandeur_id'
    remove_index 'dossiers', :column => 'cat_id'
    remove_index 'dossiers', :column => 'niveau_id'
    remove_index 'dossiers', :column => 'accmod_id'
    remove_index 'dossiers', :column => 'profession_id'
    remove_index 'dossiers', :column => 'correspondant_id'
    remove_index 'dossiers', :column => 'acctype_id'
  end
end
