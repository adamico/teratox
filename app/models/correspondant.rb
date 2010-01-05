class Correspondant < ActiveRecord::Base
  has_many :dossiers
  belongs_to :specialite
  belongs_to :qualite

  validates_presence_of :name
end


# == Schema Information
# Schema version: 20100105082615
#
# Table name: correspondants
#
#  id            :integer         not null, primary key
#  specialite_id :integer
#  qualite_id    :integer
#  formule_id    :integer
#  name          :string(255)
#  adresse       :text
#  cp            :integer
#  ville         :string(255)
#  tel           :integer
#  fax           :integer
#  poste         :integer
#  email         :string(255)
#

