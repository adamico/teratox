class RenameNomInCorrespondants < ActiveRecord::Migration
  def self.up
    change_table :correspondants do |t|
      t.rename  :nom, :name
    end
  end

  def self.down
    change_table :correspondants do |t|
      t.rename  :name, :nom
    end
  end
end
