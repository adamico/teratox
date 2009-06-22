class AlterApafToDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.rename  :ap, :ap_id
      t.rename  :af, :af_id
      t.rename  :assmedproc, :assmedproc_id
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.rename  :ap_id, :ap
      t.rename  :af_id, :af
      t.rename  :assmedproc_id, :assmedproc
    end
  end
end
