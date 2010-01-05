class Profession < ActiveRecord::Base
  #TODO rénommer ce modèle en poste_travail
  has_many :dossiers
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: professions
#
#  id   :integer         not null, primary key
#  name :string(255)
#

