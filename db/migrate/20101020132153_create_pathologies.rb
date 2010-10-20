class CreatePathologies < ActiveRecord::Migration
  def self.up
    create_table :pathologies do |t|
      t.integer :code_terme
      t.integer :code_terme_pere
      t.string :libabr
      t.integer :level
      t.string :libelle
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pathologies
  end
end
