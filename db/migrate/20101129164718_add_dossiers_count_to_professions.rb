class AddDossiersCountToProfessions < ActiveRecord::Migration
  def self.up
    add_column :professions, :dossiers_count, :integer

    Profession.reset_column_information
    Profession.all.each do |profession|
      Profession.update_counters profession.id, :dossiers_count => profession.dossiers.length
    end
  end

  def self.down
    remove_column :professions, :dossiers_count
  end
end
