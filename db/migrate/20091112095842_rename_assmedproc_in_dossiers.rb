class RenameAssmedprocInDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.rename :assmedproc_id, :assmedproc
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.rename :assmedproc, :assmedproc_id
    end
  end
end
