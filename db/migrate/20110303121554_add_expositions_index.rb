class AddExpositionsIndex < ActiveRecord::Migration
  def self.up
    add_index :expositions, :produit_id
    add_index :expositions, :terme_id
    add_index :expositions, :niveau_id
  end

  def self.down
    remove_index :expositions, :column => :niveau_id
    remove_index :expositions, :column => :terme_id
    remove_index :expositions, :column => :produit_id
  end
end
