class AddMalformeToBebes < ActiveRecord::Migration
  def self.up
    add_column :bebes, :malforme, :integer, :default => 0
  end

  def self.down
    remove_column :bebes, :malforme
  end
end
