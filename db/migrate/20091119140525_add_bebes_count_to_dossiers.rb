class AddBebesCountToDossiers < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :bebes_count, :integer, :default => 0

    say_with_time("Populating dossiers counter cache column for bebes") do
      Dossier.reset_column_information
      Dossier.all.each do |dossier|
        Dossier.update_counters dossier.id, :bebes_count => dossier.bebes.length
        say "dossier #{dossier.id} bebes_count column was updated"
      end
    end
  end

  def self.down
    remove_column :dossiers, :bebes_count
  end
end
