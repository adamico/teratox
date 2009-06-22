class AlterDateappelColumnInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change(:date_appel, :datetime)
      t.change(:ddr, :datetime)
      t.change(:dra, :datetime)
      t.change(:dap, :datetime)
      t.change(:dg, :datetime)
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.change(:date_appel, :date)
      t.change(:ddr, :date)
      t.change(:dra, :date)
      t.change(:dap, :date)
      t.change(:dg, :date)
    end
  end
end
