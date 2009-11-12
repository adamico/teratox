class ChangeDefaultsInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change_default(:fcs, "0")
      t.change_default(:geu, "0")
      t.change_default(:miu, "0")
      t.change_default(:ivg, "0")
      t.change_default(:img, "0")
      t.change_default(:nai, "0")
    end
  end

  def self.down
     raise ActiveRecord::IrreversibleMigration
  end
end
