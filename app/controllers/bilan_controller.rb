class BilanController < ApplicationController
  before_filter :find_dossiers
  before_filter :find_niveaux, :only => [:niveaux, :stratification]

  def index
  end
  def cat
    @cats = Cat.all
    @no_cat = Dossier.no_cat
    @no_cat_solvants = @solvants.no_cat
    @no_cat_autres = @no_cat - @solvants.no_cat
  end

  def donnees_generales
    @age_lt35 = Dossier.age_lt_35.count
    @solvage_lt35 = @solvants.age_lt_35.count
    @autres_age_lt35 = @age_lt35 - @solvage_lt35

    @p1g1 = Dossier.p1g1.count
    @solv_p1g1 = @solvants.p1g1.count
    @autres_p1g1 = @p1g1 - @solv_p1g1
  end

  def niveaux
    @niveaux = Niveau.all
  end

  def issues
    @evolutions = Acctype.all
    @bebes = Bebe.all
  end

  def stratification
  end

  #TODO aggiungere CAT préconisées
  private

  def find_dossiers
    @dossiers = Dossier.all
    @solvants = Dossier.solvants
    @autres = Dossier.autres

    @count = @dossiers.count
    @solv_count = @solvants.count
    @autres_count = @count - @solv_count
  end
  def find_niveaux
    @niveaux = Niveau.all
  end
end
