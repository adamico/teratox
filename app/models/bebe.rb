class Bebe < ActiveRecord::Base
  belongs_to :dossier
  has_and_belongs_to_many :pathologies
  has_and_belongs_to_many :malformations

  def sex
    case sexe
    when 0; "inconnu"
    when 1; "garçon"
    else "fille"
    end
  end

  def malf
    if malformation
      "oui"
    else "non"
    end
  end

  def path
    if pathologie 
      "oui"
    else "non"
    end
  end
end
