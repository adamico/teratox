class AddIndexesToCorrespondants < ActiveRecord::Migration
  def self.up
    add_index :correspondants, [:specialite_id, :qualite_id, :formule_id]
  end

  def self.down
    remove_index :correspondants, :column => [:specialite_id, :qualite_id, :formule_id]
  end
end
