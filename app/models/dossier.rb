class Dossier < ActiveRecord::Base
  require 'chronic'

  # Validations
  validates_presence_of :n_sicap
  validates_presence_of :nom
  validates_presence_of :acctype_id
  validates_uniqueness_of :n_sicap
  validates_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai, :allow_blank => true
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

  # Named Scopes
  named_scope :solvants, :include => :produits, :conditions => { 'produits.name' => 'SOLVANT(S)' }
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
    case ap_id
    when 1; "aucun"
    when 2; "inconnus"
    else comm_ap
    end
  end

  def atcdf
    case af_id
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
    a = [fcs, geu, miu, ivg, img, nai]
    b = a.sum + 1
    d = b.to_s
    if b == ( nai + 1 )
      d
    else
      c = %w{ fcs geu miu ivg img nai }
      d = b.to_s + " (dont"
      for i in 0..4
        if a[i]==0
          next
        end
        d+= " " + a[i].to_s + " " + c[i].to_s
      end
      d+= ")"
      d
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
      a="#{acctype.name} " + "à #{terme} SA "
      if acctype_id==5
        a+= "par #{accmod.name}"
        a
      else
        a
      end
    else
      acctype.name
    end
  end
end
