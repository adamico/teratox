class AddExpotypeToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :expo_type, :string

    say_with_time("Assign expo_type column to solvants if dossier contains a produit of that kind") do
      solvant = Produit.find(3760)
      Dossier.all.each do |d|
        if d.produits.include?(solvant)
          d.update_attribute :expo_type, 'solvants'
          say "dossier #{d.id} was changed to 'solvant' expo_type"
        else
          d.update_attribute :expo_type, 'autres'
          say "dossier #{d.id} was changed to 'autres' expo_type"
        end
      end
    end
  end

  def self.down
    remove_column :dossiers, :expo_type
  end
end
