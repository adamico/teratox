class CreateBebes < ActiveRecord::Migration
  def self.up
    create_table :bebes do |t|
      t.references :dossier
      t.boolean :malformation, :pathologie
      t.integer :sexe, :poids, :apgar1, :apgar5, :pc, :taille

    end
  end

  def self.down
    drop_table :bebes
  end
end
