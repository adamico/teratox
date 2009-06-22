class AlterBebesColumns2 < ActiveRecord::Migration
  def self.up
    change_table :bebes do |t|
      t.change(:poids, :string)
      t.change(:apgar1, :string)
      t.change(:apgar5, :string)
      t.change(:pc, :string)
      t.change(:taille, :string)
    end
  end

  def self.down
    change_table :bebes do |t|
      t.change(:poids, :integer)
      t.change(:apgar1, :integer)
      t.change(:apgar5, :integer)
      t.change(:pc, :integer)
      t.change(:taille, :integer)
    end
  end
end
