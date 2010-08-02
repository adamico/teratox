class AddIndexesToBebes < ActiveRecord::Migration
  def self.up
    add_index :bebes, :dossier_id
  end

  def self.down
    remove_index :bebes, :column => :dossier_id
  end
end
