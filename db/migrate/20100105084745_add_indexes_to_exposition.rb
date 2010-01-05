class AddIndexesToExposition < ActiveRecord::Migration
  def self.up
    add_index 'expositions', 'dossier_id'
  end

  def self.down
    remove_index 'expositions', :column => 'dossier_id'
  end
end
