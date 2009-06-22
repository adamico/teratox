class CreateAcctypes < ActiveRecord::Migration
  def self.up
    create_table :acctypes do |t|
      t.string :abbr
      t.string :name
    end
  end

  def self.down
    drop_table :acctypes
  end
end
