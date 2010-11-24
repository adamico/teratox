class AddDossiersCountToNiveaux < ActiveRecord::Migration
  def self.up
    add_column :niveaux, :dossiers_count, :integer

    Niveau.reset_column_information
    Niveau.all.each do |niveau|
      Niveau.update_counters niveau.id, :dossiers_count => niveau.dossiers.length
    end
  end

  def self.down
    remove_column :niveaux, :dossiers_count
  end
end
