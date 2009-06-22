class RemovePariteFromDossier < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.remove :parite
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
