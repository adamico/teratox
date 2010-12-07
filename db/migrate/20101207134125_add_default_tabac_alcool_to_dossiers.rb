class AddDefaultTabacAlcoolToDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change_default :tabac, 0
      t.change_default :alcool, 0
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
