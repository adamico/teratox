class CreateAccmods < ActiveRecord::Migration
  def self.up
    create_table :accmods do |t|
      t.string :abbr
      t.string :name

    end
  end

  def self.down
    drop_table :accmods
  end
end
