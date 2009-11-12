class RenameApAfInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.rename :ap_id, :ap
      t.rename :af_id, :af
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.rename :ap, :ap_id
      t.rename :af, :af_id
    end
  end
end
