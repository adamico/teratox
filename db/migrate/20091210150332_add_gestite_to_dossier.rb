class AddGestiteToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :gestite, :integer

    say_with_time("Populating dossiers table gestite column") do
      Dossier.all.each do |d|
        sum = 0
        sum += d.fcs + d.geu + d.miu + d.ivg + d.img + d.nai
        sum += 1
        d.update_attribute :gestite, sum
        say "Dossier#{d.id} gestite updated to #{d.gestite}"
      end
    end
  end

  def self.down
    remove_column :dossiers, :gestite
  end
end
