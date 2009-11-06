class HomeController < ApplicationController
  def index
    params[:search] ||= {}
  end

  def bilan
    @dossiers = Dossier.all
    @last = Dossier.last
    @solvants ||= Dossier.produits_name_like('solvant')
    @autres_nr = @dossiers.count - @solvants.count
    @autres_age_total = Dossier.sum(:age) - @solvants.sum(:age)
    @autres_age_moyen ||= @autres_age_total / @autres_nr
    @evolutions ||= Acctype.all
    @bebes ||= Bebe.all
    @niveaux ||= Niveau.all
  end
end
