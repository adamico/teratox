class Produit < ActiveRecord::Base
  has_many :dossiers, :through => :expositions
  has_many :expositions

  validates_presence_of :name

  default_scope order("LOWER(name) ASC")
end



# == Schema Information
# Schema version: 20101020134225
#
# Table name: produits
#
#  id   :integer         not null, primary key
#  name :string(255)
#

