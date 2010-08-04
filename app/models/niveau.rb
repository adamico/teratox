class Niveau < ActiveRecord::Base
  has_many :expositions
  has_many :dossiers
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: niveaux
#
#  id   :integer         not null, primary key
#  name :string(255)
#

