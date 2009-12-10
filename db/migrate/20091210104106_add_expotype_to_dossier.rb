class AddExpotypeToDossier < ActiveRecord::Migration
  def self.up
    add_column :dossiers, :expo_type, :string

    solvant = Produit.find(3760)
    Dossier.all.each do |d|
      if d.produits.include?(solvant)
        d.update_attribute :expo_type, 'solvants'
      else
        d.update_attribute :expo_type, 'autres'
      end
    end
  end

  def self.down
    remove_column :dossiers, :expo_type
  end
end
