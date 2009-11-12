class AddCatToDossiers < ActiveRecord::Migration
  def self.up
    change_table :dossiers do |t|
      t.references :cat
    end
  end

  def self.down
    change_table :dossiers do |t|
      t.remove_references :cat
    end
  end
end
