class Exposition < ActiveRecord::Base
  belongs_to :dossier
  belongs_to :produit
  belongs_to :niveau
end
