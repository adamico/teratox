class AddDossiersCountToAcctypes < ActiveRecord::Migration
  def self.up
    add_column :acctypes, :dossiers_count, :integer

    Acctype.reset_column_information
    Acctype.all.each do |acctype|
      Acctype.update_counters acctype.id, :dossiers_count => acctype.dossiers.length
    end
  end

  def self.down
    remove_column :acctypes, :dossiers_count
  end
end
