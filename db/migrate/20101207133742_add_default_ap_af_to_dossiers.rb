class AddDefaultApAfToDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change_default :ap, 1
      t.change_default :af, 1
    end
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
