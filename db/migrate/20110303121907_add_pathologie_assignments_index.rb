class AddPathologieAssignmentsIndex < ActiveRecord::Migration
  def self.up
    add_index :pathologie_assignments, :bebe_id
    add_index :pathologie_assignments, :pathologie_id
  end

  def self.down
    remove_index :pathologie_assignments, :column => :pathologie_id
    remove_index :pathologie_assignments, :column => :bebe_id
  end
end
