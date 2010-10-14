class CreateMalformations < ActiveRecord::Migration
  def self.up
    create_table :malformations do |t|
      t.integer :code_terme
      t.integer :code_terme_pere
      t.string :libabr
      t.integer :level
      t.string :libelle

      t.timestamps
    end
  end

  def self.down
    drop_table :malformations
  end
end
