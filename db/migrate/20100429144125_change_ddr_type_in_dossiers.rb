class ChangeDdrTypeInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change(:ddr, :date)
      t.change(:dg, :date)
      t.change(:dap, :date)
      t.change(:dra, :date)
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.change(:ddr, :datetime)
      t.change(:dg, :datetime)
      t.change(:dap, :datetime)
      t.change(:dra, :datetime)
    end
  end
end
