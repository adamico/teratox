# encoding: utf-8
class Dossier < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20

  attr_accessible :n_sicap, :date_appel, :demandeur_id,
    :fcs, :geu, :miu, :ivg, :img, :nai, :sa, :ddr, :dg, :dap,
    :nom, :prenom, :age, :date_naissance, :profession_id,
    :af, :comm_af, :ap, :comm_ap, :tabac, :alcool,
    :expo_type, :niveau_id, :cat_id,
    :acctype_id, :accmod_id, :path_math, :dra, :terme,
    :anomalie_echo, :rciu, :comm_evol,
    :comm_expo, :comm_bebe, :commentaire

  # Validations
  validates :n_sicap, :presence => true, :uniqueness => true
  validates_presence_of :nom, :acctype_id, :expo_type, :date_appel
  validates_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai
  validates_numericality_of :sa, :less_than => 40, :allow_blank => true

  # Associations
  #TODO aggiungere has_one :patient e popolare con i dati della table dossiers
  belongs_to :profession, :counter_cache => true
  belongs_to :acctype, :counter_cache => true
  belongs_to :niveau, :counter_cache => true
  belongs_to :cat, :counter_cache => true
  belongs_to :accmod
  belongs_to :correspondant
  belongs_to :demandeur

  has_many :produits, :through => :expositions
  has_many :expositions, :dependent => :destroy
  accepts_nested_attributes_for :expositions, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs['produit_name'].blank? }

  has_many :bebes, :dependent => :destroy
  accepts_nested_attributes_for :bebes, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? }}

  before_save :calculate_gestite

  # csv export method
  require "csv"

  def to_csv
    headers = []
    CSV_HEADERS.each do |header|
      if header == "age"
        headers << self.patient_age
      else
        headers << self.send(header)
      end
    end
    CSV.generate_line(headers)
  end

  # Constants
  CSV_HEADERS = %w[n_sicap age sa gestite nai fcs ivg acctype_abbr niveau_name]
  ONI = [["Oui", "0"], ["Non", "1"], ["Inconnu", "2"]]
  TABAC = [["0", "0"], ["0 à 5", "1"], ["5 à 10", "2"], ["Sup. à 10", "3"], ["Inconnu", "4"]]
  ALCOOL = [["0", "0"], ["<= 2", "1"], ["> 2", "2"], ["Inconnu", "3"]]

  # Named Scopes
  scope :solvants, where(:expo_type => 'solvants')
  scope :autres, where(:expo_type => 'autres')

  scope :avec_jumeaux, where(:bebes_count.gt => 1)
  scope :naissances, joins(:acctype).where(
    :acctype => [:abbr.matches => "%nai%"])
  scope :fausses_couches, joins(:acctype).where(
    :acctype => [:abbr.matches % "%fcs%" | :abbr.matches % "%miu%"])
  scope :incomplets, joins(:acctype).where(
    :acctype => [:abbr.matches => "%inc%"])
  scope :p1g1, where(
    :fcs => 0, :ivg => 0, :img => 0, :miu => 0, :geu => 0, :nai => 0)
  scope :prematures, where(:terme.lt => 37)
  scope :with_niveau, lambda { |niveau|
    joins(:niveaux).where(:niveaux => [:name.matches % "%#{niveau}%"])}
  scope :infimes, joins(:niveaux).where(
    :niveaux => [:name.matches % "%infime%"])
  scope :faibles, joins(:niveaux).where(
    :niveaux => [:name.matches % "%faible%"])
  scope :moderes, joins(:niveaux).where(
    :niveaux => [:name.matches % "%modéré%"])
  scope :importants, joins(:niveaux).where(
    :niveaux => [:name.matches % "%important%"])

  scope :is_malforme, joins(:bebes).where(:bebes => [:malforme => "1"])
  scope :recent, includes([:profession, :acctype, :expositions]).order("updated_at DESC").limit(10)
  scope :p1g1, where(:gestite => 1, :nai => 0)
  scope :age_lt_35, where(:age.lt => 35)
  scope :no_cat, where(:cat_id => nil)

  # metasearch search methods
  search_methods :is_malforme

  # delegations
  delegate :name,
    :to => :profession, :prefix => true, :allow_nil => true
  delegate :specialite_name, :qualite_name, :adresse, :cp, :ville,
    :to => :correspondant,
    :prefix => true,
    :allow_nil => true
  delegate :name, :to => :demandeur, :prefix => true, :allow_nil => true
  delegate :name, :to => :niveau, :prefix => true, :allow_nil => true
  delegate :name, :to => :cat, :prefix => true, :allow_nil => true
  delegate :name, :to => :acctype, :prefix => true, :allow_nil => true
  delegate :abbr, :to => :acctype, :prefix => true, :allow_nil => true

  # custom methods
  def patient_age
    if date_naissance
      Date.today.year - date_naissance.year
    else
      age
    end
  end
  def correspondant_name
    correspondant.name if correspondant
  end
  def correspondant_name=(name)
    self.correspondant = Correspondant.find_by_name(name)
  end

  def self.get_nonzero_birthweight
    lespoids = []
    self.all.each do |d|
      lespoids << d.bebes.map { |b| b.poids.to_i }
    end
    lespoids.flatten!.compact!
    lespoids.reject { |p| p == 0}
  end

  def self.avg_birthweight
    total = 0
    lespoids = self.get_nonzero_birthweight
    lespoids.each do |p|
      total += p
    end
    total / lespoids.size
  end

  def self.sd_birthweight
    lespoids = self.get_nonzero_birthweight
    n = lespoids.count
    mean = self.avg_birthweight
    ss = 0.0

    lespoids.each { |p| ss += ((p - mean) * (p - mean)) }

    Math.sqrt(ss / (n - 1))
  end

  def self.mean(col_name, options={})
    self.sum(col_name.to_s, options).to_f / self.count
  end

  def self.mean_and_sd(col_name, round=2, options={})
    mean = self.mean(col_name, options).round(round)
    sd = self.std_deviation(col_name, options).round(round)
    "#{mean} (#{sd})"
  end

  def self.variance(col_name, options={})
    n = self.count
    mean = self.mean(col_name, options)
    self.sum("(#{col_name} - #{mean}) * (#{col_name} - #{mean})", options) / (n - 1)
  end

  def self.std_deviation(col_name, options={})
    Math.sqrt(self.variance(col_name, options))
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

  def cigarettes
    cigJour = [ 
      'ne fume pas',
      'jusqu\'à 5 ',
      '5 à 10 ',
      'plus de 10 ',
      'consommation inconnue']
    unless tabac.nil?
      case tabac
        when 0; cigJour[0]
        when 4; cigJour[4]
        else "fume " + cigJour[tabac] + "cigarettes par jour"
      end
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

  #TODO refactor Dossiers#show and #form using gestite and not grsant
  def grsant
    a = [fcs, geu, miu, ivg, img, nai]
    a.sum
  end

  #FIXME: move dossier#gestite_in_words to a helper
  def gestite_in_words
    grs_ant = [fcs, geu, miu, ivg, img, nai]
    abbr = %w{ fcs geu miu ivg img nai } # array des abbreviations
    out = "G" # abbreviation du mot 'gestité'
    out+= (grsant + 1).to_s # gestite = Gn où n est grs_tot converti en chaine de charactères
    strings = [nil,nil,nil,nil,nil,nil] # array vide où l'on va mettre les nombre d'évol par type
    # si nombre grs antérieures = nombre de naissances
    # on s'arrète là
    if grsant == nai
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

  # info sur l'évolution
  def date_acc
    "Date d'accouchement : #{dra.strftime("%d-%m-%Y")}" unless dra.nil?
  end

  def evolution
    case acctype_id
    when 1..5
      a="#{acctype.name} "
      a+= "à #{terme} SA " unless terme.nil?
      # FIXME: check for acctype.name and not id!
      a+= "par #{accmod.name}" if acctype_id==5
      a
    else
      acctype.name
    end
  end

  private

  def calculate_gestite
    a = [fcs, geu, miu, ivg, img, nai]
    self.gestite = a.sum + 1
  end
end




# == Schema Information
# Schema version: 20101020134225
#
# Table name: dossiers
#
#  id               :integer         not null, primary key
#  n_sicap          :string(255)
#  acctype_id       :integer
#  correspondant_id :integer
#  profession_id    :integer
#  ncode            :integer
#  date_appel       :date
#  ddr              :date
#  dra              :date
#  dap              :date
#  dg               :date
#  nom              :string(30)
#  prenom           :string(30)
#  age              :integer
#  ap               :integer
#  af               :integer
#  assmedproc       :integer
#  fcs              :integer         default(0)
#  geu              :integer         default(0)
#  miu              :integer         default(0)
#  ivg              :integer         default(0)
#  img              :integer         default(0)
#  nai              :integer         default(0)
#  terme            :integer
#  accmod_id        :integer
#  path_mat         :integer
#  tabac            :integer
#  alcool           :integer
#  sa               :integer
#  comm_ap          :text
#  comm_af          :text
#  comm_expo        :text
#  comm_evol        :text
#  comm_bebe        :text
#  commentaire      :text
#  created_at       :datetime
#  updated_at       :datetime
#  niveau_id        :integer
#  cat_id           :integer
#  demandeur_id     :integer
#  bebes_count      :integer         default(0)
#  expo_type        :string(255)
#  gestite          :integer
#  terato           :boolean
#  date_naissance   :date
#  anomalie_echo    :boolean
#  rciu             :boolean
#

