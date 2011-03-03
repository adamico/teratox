class AddDossiersCountToCats < ActiveRecord::Migration
  def self.up
    add_column :cats, :dossiers_count, :integer

    say_with_time("Populating cats counter cache column for dossiers") do
      Cat.reset_column_information
      Cat.all.each do |cat|
        Cat.update_counters cat.id, :dossiers_count => cat.dossiers.length
        say "cat #{cat.id} dossiers_count column was updated"
      end
    end
  end

  def self.down
    remove_column :cats, :dossiers_count
  end
end
