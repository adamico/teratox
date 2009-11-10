class CreateSpecialites < ActiveRecord::Migration
  def self.up
    create_table :specialites do |t|
      t.string :libelle
    end
  end

  def self.down
    drop_table :specialites
  end
end
