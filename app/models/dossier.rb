class Dossier < ActiveRecord::Base
  require 'chronic'

  # Validations
  validates_presence_of :n_sicap
  validates_presence_of :nom
  validates_presence_of :acctype_id
  #validates_uniqueness_of :n_sicap
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

  # Named Scopes
  alias_scope :solvants, lambda { produits_name_like('solvant') }
  
  named_scope :incomplets, :conditions => { :acctype_id => 6 } # evolution inconnue

  # custom methods

  def year
    date_appel.year
  end

  def expotype
    prnames = produits.collect { |p| p.name }
    if prnames.include? "SOLVANT(S)"
      "SOLVANT(S)"
    else
      "AUTRES"
    end
  end

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

  # cigarettes and alcool virtual attributes may be made 'more DRY'
  # and thus used in _form as radio_button labels
  # and maybe use a helper for the show view

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

  # info sur la grossesse
  def grsant
    a = [fcs, geu, miu, ivg, img, nai]
    b = a.sum
  end

  def gestite
    grs_ant = [fcs, geu, miu, ivg, img, nai]
    grs_tot = grs_ant.sum + 1 # somme des grossesses antérieures + celle actuelle
    abbr = %w{ fcs geu miu ivg img nai } # array des abbreviations
    out = "G" # abbreviation du mot 'gestité'
    out+= grs_tot.to_s # gestite = Gn où n est b converti en chaine de charactères
    strings = [nil,nil,nil,nil,nil,nil] # array vide où l'on va mettre les nombre d'évol par type
    # si nombre grs antérieures = nombre de naissances
    # on s'arrète là
    if grs_tot == nai + 1
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
