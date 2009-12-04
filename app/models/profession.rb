class Profession < ActiveRecord::Base
  #TODO rénommer ce modèle en poste_travail
  has_many :dossiers
end
