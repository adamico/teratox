class HomeController < ApplicationController
  def index
    params[:search] ||= {}
  end

  def bilan
    @dossiers = Dossier.all
    @count ||= @dossiers.count
    @age_moyen ||= Dossier.average(:age).round(1)
    @age_sd ||= Math.sqrt(
      Dossier.sum(
        "(age - #{@age_moyen}) * (age - #{@age_moyen})"
      ).to_f / @count
    ).round(1)
    @age_lt35 = Dossier.age_lt(35).count
    @p1g1 = Dossier.fcs_is(0).ivg_is(0).img_is(0).miu_is(0).geu_is(0).nai_is(0).count
    @last = Dossier.last
    @solvants ||= Dossier.solvants
    @solv_count ||= @solvants.count
    @solvage_moyen ||= @solvants.average(:age).round(1)
    @solvage_sd ||= Math.sqrt(
      @solvants.sum(
        "(age - #{@solvage_moyen}) * (age - #{@solvage_moyen})"
      ).to_f / @solv_count
    ).round(1)
    @solvage_lt35 = @solvants.age_lt(35).count
    @solv_p1g1 = @solvants.fcs_is(0).ivg_is(0).img_is(0).miu_is(0).geu_is(0).nai_is(0).count
    @autres_nr = @dossiers.count - @solvants.count
    @autres_age_total = Dossier.sum(:age) - @solvants.sum(:age)
    @autres_age_moyen ||= (@autres_age_total / @autres_nr).to_f
    @evolutions ||= Acctype.all
    @bebes ||= Bebe.all
    @niveaux ||= Niveau.all
  end
end
