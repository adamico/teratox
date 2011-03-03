class AddCorrespondantsIndex < ActiveRecord::Migration
  def self.up
    add_index :correspondants, :specialite_id
    add_index :correspondants, :qualite_id
  end

  def self.down
    remove_index :correspondants, :column => :qualite_id
    remove_index :correspondants, :column => :specialite_id
  end
end
