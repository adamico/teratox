class Correspondant < ActiveRecord::Base
  has_many :dossiers
  belongs_to :specialite
  belongs_to :qualite

  validates :name, :presence => true

  SEXES = {"INC" => 0, "M" => 1, "F" => 2}

  delegate :name, :to => :specialite, :prefix => true, :allow_nil => true
  delegate :name, :to => :qualite, :prefix => true, :allow_nil => true

  def lesexe
    sexes = SEXES.invert
    sexes[sexe]
  end
end




# == Schema Information
# Schema version: 20101020134225
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
#  sexe          :integer
#

