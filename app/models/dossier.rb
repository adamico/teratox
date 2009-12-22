# encoding:utf-8
class Dossier < ActiveRecord::Base
  require 'chronic'

  #TODO aggiungere gli attr_accessible
  # Validations
  validates_presence_of :n_sicap
  validates_presence_of :nom
  validates_presence_of :acctype_id
  #TODO add validates_uniqueness_of :n_sicap
  validates_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai
  validates_numericality_of :sa, :less_than => 40, :allow_blank => true

  # Associations
  belongs_to :profession
  belongs_to :acctype
  belongs_to :accmod
  has_many :produits, :through => :expositions
  has_many :expositions, :dependent => :destroy
  accepts_nested_attributes_for :expositions, :allow_destroy => true, :reject_if => proc { |attrs| attrs['produit_name'].blank? }

  has_many :bebes, :dependent => :destroy
  accepts_nested_attributes_for :bebes, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

  belongs_to :niveau
  belongs_to :correspondant
  accepts_nested_attributes_for :correspondant

  belongs_to :cat
  belongs_to :demandeur

  # Named Scopes
  alias_scope :solvants, lambda { expo_type_is('solvants') }
  alias_scope :autres, lambda { expo_type_is('autres') }
  alias_scope :avec_jumeaux, lambda { bebes_count_gt(1) }
  alias_scope :naissances, lambda { acctype_id_is(5) }
  alias_scope :fausses_couches, lambda { acctype_id_is_any(1, 4) }
  alias_scope :p1g1, lambda { fcs_is(0).ivg_is(0).img_is(0).miu_is(0).geu_is(0).nai_is(0) }

  named_scope :incomplets, :conditions => { :acctype_id => 6 }
  named_scope :is_malforme, :include => :bebes, :conditions => {'bebes.malforme' => 1}

  # custom methods
 
  #TODO eliminare i campi ddr, dap, dg, mantenere giusto SA e calcolarlo in base a una delle date conosciute

  def short_name
    [nom.upcase, initiale_prenom].compact.join(' ')
  end

  def initiale_prenom
    "#{prenom.first}." unless prenom.blank?
  end

  def atcdp
    case ap
    when 1; "aucun"
    when 2; "inconnus"
    else comm_ap
    end
  end

  def atcdf
    case af
    when 1; "aucun"
    when 2; "inconnus"
    else comm_af
    end
  end

  def cigarettes
    cigJour = [ 
      'ne fume pas',
      'jusqu\'à 5 ',
      '5 à 10 ',
      'plus de 10 ',
      'consommation inconnue']
    case tabac
      when 0; cigJour[0]
      when 4; cigJour[4]
      else "fume " + cigJour[tabac] + "cigarettes par jour"
    end
  end

  def boisson
    boiJour = [ 
      'ne boit pas',
      'occasionnelle (moins de 2 ',
      'fréquente (plus de 2 ',
      'inconnue']
    case alcool
      when 0; boiJour[0]
      when 3; boiJour[3]
      else "consommation " + boiJour[alcool] + "verres par jour)"
    end
  end

  #TODO creare due colonna per calcolare parité et gestite (à l'inclusion)
  # info sur la grossesse
  def grsant
    a = [fcs, geu, miu, ivg, img, nai]
    b = a.sum
  end

  def gestite_in_words
    grs_ant = [fcs, geu, miu, ivg, img, nai]
    abbr = %w{ fcs geu miu ivg img nai } # array des abbreviations
    out = "G" # abbreviation du mot 'gestité'
    out+= gestite.to_s # gestite = Gn où n est grs_tot converti en chaine de charactères
    strings = [nil,nil,nil,nil,nil,nil] # array vide où l'on va mettre les nombre d'évol par type
    # si nombre grs antérieures = nombre de naissances
    # on s'arrète là
    if gestite == nai + 1
      out
    # sinon dis moi quelles évolutions et combien de fois
    else
      grs_ant.each_with_index do |evol, index|
        strings[index] = evol.to_s + " " + abbr[index] unless evol == 0 || index == 5
      end
      out+= " (dont "
      out+= strings.compact.join(', ')
      out+= ")"
      out
    end
  end

  def dg_string
    dg.to_s
  end

  def dg_string=(dg_str)
    self.dg = Chronic.parse(dg_str)
  rescue ArgumentError
    @dg_invalid = true
  end

  def validate
    errors.add(:dg, "La date de debut de grossesse n'est pas valide") if @dg_invalid
  end

  # info sur l'évolution
  def date_acc
    "Date d'accouchement : #{dra.strftime("%d-%m-%Y")}" unless dra.nil?
  end

  def evolution
    case acctype_id
    when 1..5
      a="#{acctype.name} "
      a+= "à #{terme} SA " unless terme.nil?
      a+= "par #{accmod.name}" if acctype_id==5
      a
    else
      acctype.name
    end
  end
end
