class ChangeDateAppelTypeInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.change :date_appel, :date
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.change :date_appel, :datetime
    end
  end
end
