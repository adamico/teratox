class Exposition < ActiveRecord::Base
  belongs_to :dossier
  belongs_to :produit
  belongs_to :niveau

  def produit_name
    produit.name if produit
  end
  def produit_name=(name)
    self.produit = Produit.find_or_create_by_name(name) unless name.blank?
  end
end
