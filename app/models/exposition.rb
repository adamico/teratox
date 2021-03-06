class Exposition < ActiveRecord::Base
  belongs_to :dossier
  belongs_to :produit
  belongs_to :niveau

  delegate :name, :to => :niveau, :prefix => true, :allow_nil => true
  def produit_name
    produit.name if produit
  end
  def produit_name=(name)
    self.produit = Produit.find_or_create_by_name(name) unless name.blank?
  end
end



# == Schema Information
# Schema version: 20101020134225
#
# Table name: expositions
#
#  id         :integer         not null, primary key
#  dossier_id :integer
#  produit_id :integer
#  terme_id   :integer
#  niveau_id  :integer
#

