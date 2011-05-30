class AddTeratoToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :terato, :boolean, :default => 0
    say_with_time("Setting terato field to 0 for existing records") do
      Dossier.all.each do |d|
        say "Updating dossier##{d.id}"
        d.update_attribute :terato, 0
      end
    end
  end

  def self.down
    remove_column :dossiers, :terato
  end
end
