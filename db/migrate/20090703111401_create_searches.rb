class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.integer :produit_id
      t.string :n_sicap
      t.datetime :min_date
      t.datetime :max_date
      t.integer :acctype_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :searches
  end
end
