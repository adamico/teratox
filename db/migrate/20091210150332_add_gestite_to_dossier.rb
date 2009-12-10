class AddGestiteToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :gestite, :integer

    Dossier.all.each do |d|
      sum = 0
      puts "Starting: Sum = #{sum}"
      sum += d.fcs + d.geu + d.miu + d.ivg + d.img + d.nai
      puts "Sum is now = #{sum}"
      sum += 1
      d.update_attribute :gestite, sum
      puts "Dossier#{d.id} gestite is #{d.gestite}"
    end
    puts "All done"
  end

  def self.down
    remove_column :dossiers, :gestite
  end
end
