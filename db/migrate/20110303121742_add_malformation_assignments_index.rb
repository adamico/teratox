class AddMalformationAssignmentsIndex < ActiveRecord::Migration
  def self.up
    add_index :malformation_assignments, :bebe_id
    add_index :malformation_assignments, :malformation_id
  end

  def self.down
    remove_index :malformation_assignments, :column => :malformation_id
    remove_index :malformation_assignments, :column => :bebe_id
  end
end
