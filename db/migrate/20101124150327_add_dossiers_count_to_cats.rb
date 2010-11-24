class AddDossiersCountToCats < ActiveRecord::Migration
  def self.up
    add_column :cats, :dossiers_count, :integer

    Cat.reset_column_information
    Cat.all.each do |cat|
      Cat.update_counters cat.id, :dossiers_count => cat.dossiers.length
    end
  end

  def self.down
    remove_column :cats, :dossiers_count
  end
end
