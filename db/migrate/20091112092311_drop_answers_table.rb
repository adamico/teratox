class DropAnswersTable < ActiveRecord::Migration
  def self.up
    drop_table :answers
  end

  def self.down
    create_table :answers do |t|
      t.column :name, :string
    end
  end
end
