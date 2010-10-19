class CreateMalformationAssignments < ActiveRecord::Migration
  def self.up
    create_table :malformation_assignments do |t|
      t.references :bebe
      t.references :malformation

      t.timestamps
    end
  end

  def self.down
    drop_table :malformation_assignments
  end
end
