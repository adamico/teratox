class Produit < ActiveRecord::Base
  has_many :dossiers, :through => :expositions
  has_many :expositions

  validates_presence_of :name
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: produits
#
#  id   :integer         not null, primary key
#  name :string(255)
#

