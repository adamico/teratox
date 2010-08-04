class CreateExpositions < ActiveRecord::Migration
  def self.up
    create_table :expositions do |t|
      t.references :dossier, :produit, :terme, :niveau
    end
  end

  def self.down
    drop_table :expositions
  end
end
