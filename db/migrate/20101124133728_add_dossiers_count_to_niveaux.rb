class AddDossiersCountToNiveaux < ActiveRecord::Migration
  def self.up
    add_column :niveaux, :dossiers_count, :integer

    say_with_time("Populating niveaus counter cache column for dossiers") do
      Niveau.reset_column_information
      Niveau.all.each do |niveau|
        Niveau.update_counters niveau.id, :dossiers_count => niveau.dossiers.length
        say "niveau #{niveu.id} dossiers_count column was updated"
      end
    end
  end

  def self.down
    remove_column :niveaux, :dossiers_count
  end
end
