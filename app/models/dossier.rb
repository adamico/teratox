class Dossier < ActiveRecord::Base
  require 'chronic'
  # TODO create a setter to build n_sicap => LP0 + input value
  validates_presence_of :n_sicap
  validates_uniqueness_of :n_sicap
  validates_presence_of :nom, :prenom, :age
  validates_presence_of :fcs, :ivg, :img, :miu, :geu, :nai
  validates_numericality_of :fcs, :ivg, :img, :miu, :geu, :nai
  validates_numericality_of :age, :less_than => 55 
  validates_numericality_of :sa, :less_than => 40 

  belongs_to :profession
  belongs_to :acctype
  belongs_to :accmod

  has_many :produits, :through => :expositions

  has_many :expositions, :dependent => :destroy
  accepts_nested_attributes_for :expositions, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs['produit_id'].blank? } 

  has_many :bebes, :dependent => :destroy
  # TODO add a :reject_if condition 
  accepts_nested_attributes_for :bebes, :allow_destroy => true

  # virtual attributes
  #
  def short_name
    "#{nom.upcase} #{prenom.first}."
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
    b = a.sum
    d = b.to_s
    if b==nai
      d
    else
      c = %w{ fcs geu miu ivg img nai }
      d+= b.to_s + " (dont "
      for i in 0..4
        if a[i]==0
          next
        end
        d+= a[i].to_s + " " + c[i].to_s + ")"
      end
      d
    end
  end

  # this is to be able to enter dates in text form
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
