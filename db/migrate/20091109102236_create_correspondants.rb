class CreateCorrespondants < ActiveRecord::Migration
  def self.up
    create_table :correspondants do |t|
      t.references :specialite
      t.references :qualite
      t.references :formule
      t.string :nom
      t.text :adresse
      t.integer :cp
      t.string :ville
      t.integer :tel
      t.integer :fax
      t.integer :poste
      t.string :email
    end
  end
  
  def self.down
    drop_table :correspondants
  end
end
