class CreateQualites < ActiveRecord::Migration
  def self.up
    create_table :qualites do |t|
      t.string :libelle
    end
  end

  def self.down
    drop_table :qualites
  end
end
