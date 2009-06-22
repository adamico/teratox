class CreateNiveaux < ActiveRecord::Migration
  def self.up
    create_table :niveaux do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :niveaux
  end
end
