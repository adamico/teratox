# encoding:utf-8
class Bebe < ActiveRecord::Base
  belongs_to :dossier, :counter_cache => true

  #TODO add validations for poids, taille, pc, apgar1 et apgar5
  #TODO has_and_belongs_to_many :malformations (eliminer champ malformation)
  #TODO has_and_belongs_to_many :pathologies (éliminer champ pathologie)
  alias_scope :malformes, lambda { malforme_is(1) }
  alias_scope :normaux, lambda { malforme_is(0) }


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

  def path
    if pathologie 
      "oui"
    else "non"
    end
  end
end
