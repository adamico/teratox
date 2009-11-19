class CreateDemandeurs < ActiveRecord::Migration
  def self.up
    create_table :demandeurs do |t|
      t.string :name

    end
  end
  

  def self.down
    drop_table :demandeurs
  end
end
