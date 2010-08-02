class AddSexeToCorrespondant < ActiveRecord::Migration
  def self.up
    add_column :correspondants, :sexe, :integer
  end

  def self.down
    remove_column :correspondants, :sexe
  end
end
