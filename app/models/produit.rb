class Produit < ActiveRecord::Base
  has_many :dossiers, :through => :expositions
  has_many :expositions

  validates_presence_of :name
end
