class AddBebesCountToDossiers < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :bebes_count, :integer, :default => 0

    Dossier.reset_column_information
    Dossier.all.each do |d|
      d.update_attribute :bebes_count, d.bebes.length
    end
  end

  def self.down
    remove_column :dossiers, :bebes_count
  end
end
