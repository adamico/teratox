class AddDossiersCountToProfessions < ActiveRecord::Migration
  def self.up
    add_column :professions, :dossiers_count, :integer

    say_with_time("Populating professions counter cache column for dossiers") do
      Profession.reset_column_information
      Profession.all.each do |profession|
        Profession.update_counters profession.id, :dossiers_count => profession.dossiers.length
        say "profession #{profession.id} dossiers_count column was updated"
      end
    end
  end

  def self.down
    remove_column :professions, :dossiers_count
  end
end
