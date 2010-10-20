class CreatePathologieAssignments < ActiveRecord::Migration
  def self.up
    create_table :pathologie_assignments do |t|
      t.references :bebe
      t.references :pathologie

      t.timestamps
    end
  end

  def self.down
    drop_table :pathologie_assignments
  end
end
