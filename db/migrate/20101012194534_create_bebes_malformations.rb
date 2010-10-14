class CreateBebesMalformations < ActiveRecord::Migration
  def self.up
    create_table :bebes_malformations, :id => false do |t|
      t.references :bebe
      t.references :malformation
    end
  end

  def self.down
    drop_table :bebes_malformations
  end
end
