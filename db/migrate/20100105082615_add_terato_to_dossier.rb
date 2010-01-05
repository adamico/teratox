class AddTeratoToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :terato, :boolean, :default => 0
    Dossier.all.each do |d|
      d.update_attribute :terato, 0
    end
  end

  def self.down
    remove_column :dossiers, :terato
  end
end
