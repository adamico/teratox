class AddDossiersCountToAcctypes < ActiveRecord::Migration
  def self.up
    add_column :acctypes, :dossiers_count, :integer

    say_with_time("Populating acctypes counter cache column for dossiers") do
      Acctype.reset_column_information
      Acctype.all.each do |acctype|
        Acctype.update_counters acctype.id, :dossiers_count => acctype.dossiers.length
        say "acctype #{acctype.id} dossiers_count column was updated"
      end
    end
  end

  def self.down
    remove_column :acctypes, :dossiers_count
  end
end
