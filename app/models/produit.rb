class Produit < ActiveRecord::Base
  has_many :expositions
  has_many :dossiers, :through => :expositions

  validates_presence_of :name
end
