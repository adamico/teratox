class Dossier < ActiveRecord::Base
  require 'chronic'

  #TODO aggiungere gli attr_accessible
  # Validations
  validates_presence_of :n_sicap, :nom, :acctype_id
  validates_uniqueness_of :n_sicap
  validates_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai
  validates_numericality_of :sa, :less_than => 40, :allow_blank => true

  # Associations
  #TODO aggiungere has_one :patient e popolare con i dati della table dossiers
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

  belongs_to :cat
  belongs_to :demandeur

  # Constants
  ONI = [["Oui", "0"], ["Non", "1"], ["Inconnu", "2"]]
  TABAC = [["0", "0"], ["0 à 5", "1"], ["5 à 10", "2"], ["Sup. à 10", "3"], ["Inconnu", "4"]]
  ALCOOL = [["0", "0"], ["<= 2", "1"], ["> 2", "2"], ["Inconnu", "3"]]
  # Named Scopes
  alias_scope :solvants, lambda { expo_type_is('solvants') }
  alias_scope :autres, lambda { expo_type_is('autres') }
  alias_scope :avec_jumeaux, lambda { bebes_count_gt(1) }
  alias_scope :naissances, lambda { acctype_id_is(5) }
  alias_scope :fausses_couches, lambda { acctype_id_is_any(1, 4) }
  alias_scope :p1g1, lambda { fcs_is(0).ivg_is(0).img_is(0).miu_is(0).geu_is(0).nai_is(0) }
  alias_scope :prematures, lambda { terme_lt(37)}

  alias_scope :infimes, lambda { niveau_id_is(1)}
  alias_scope :faibles, lambda { niveau_id_is(2)}
  alias_scope :moderes, lambda { niveau_id_is(3)}
  alias_scope :importants, lambda { niveau_id_is(4)}

  named_scope :incomplets, :conditions => { :acctype_id => 6 }
  named_scope :is_malforme, :include => :bebes, :conditions => {'bebes.malforme' => 1}

  # custom methods
  
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

  def self.avg_terme
    average(:terme).to_f.round(0)
  end

  def self.avg_and_sd(col_name, round=0, options={})
    mean = self.average(col_name.to_s, options)
    sd = self.std_deviation(col_name, options)
    "#{mean.round(round)} (#{sd.round(round)})"
  end

  def self.variance(col_name, options={})
    n = self.all.count
    mean = self.average(col_name.to_sym, options)
    self.sum("(#{col_name} - #{mean}) * (#{col_name} - #{mean})", options).to_f / (n - 1)
  end

  def self.std_deviation(col_name, options={})
    Math.sqrt(variance(col_name, options))
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
    a.sum
  end

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



# == Schema Information
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
#  terato           :boolean         default(FALSE)
#  date_naissance   :date
#  anomalie_echo    :boolean
#  rciu             :boolean
#

