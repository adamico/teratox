# encoding:utf-8
class Bebe < ActiveRecord::Base
  belongs_to :dossier, :counter_cache => true
  has_many :malformations, :through => :malformation_assignments
  has_many :malformation_assignments, :dependent => :destroy
  accepts_nested_attributes_for :malformation_assignments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs['malformation_name'].blank? }
  has_many :pathologies, :through => :pathologie_assignments
  has_many :pathologie_assignments, :dependent => :destroy
  accepts_nested_attributes_for :pathologie_assignments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs['pathologie_name'].blank? }

  #TODO add validations for poids, taille, pc, apgar1 et apgar5
  scope :malformes, where(:malforme => 1)
  scope :normaux, where(:malforme => 0)

  scope :with_dossier_solvants, joins(:dossier).where(:dossier => {:expo_type => 'solvants'})

  scope :with_dossier_niveau, lambda { |niveau|
    joins({:dossier => :niveau}).where(
      :dossier => {:niveau => {:name => niveau}}
    )
  }

  def sex
    case sexe
    when 0; "inconnu"
    when 1; "garçon"
    else "fille"
    end
  end

  def malf
    case malforme
    when 1; "oui"
    when 0; "non"
    end
  end

  #TODO refactor this to return true if pathologies count is > 0
  def path
    if pathologie
      "oui"
    else "non"
    end
  end
end



# == Schema Information
# Schema version: 20101020134225
#
# Table name: bebes
#
#  id           :integer         not null, primary key
#  dossier_id   :integer
#  malformation :boolean
#  pathologie   :boolean
#  sexe         :integer
#  poids        :string(255)
#  apgar1       :string(255)
#  apgar5       :string(255)
#  pc           :string(255)
#  taille       :string(255)
#  malforme     :integer         default(0)
#

