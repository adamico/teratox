class RenameFieldsInSpecialite < ActiveRecord::Migration
  def self.up
    change_table :specialites do |t|
      t.rename :libelle, :name
    end
    change_table :qualites do |t|
      t.rename :libelle, :name
    end
  end

  def self.down
    change_table :specialites do |t|
      t.rename :name, :libelle
    end
    change_table :qualites do |t|
      t.rename :name, :libelle
    end
  end
end
