class HomeController < ApplicationController
  def index
    params[:search] ||= {}
  end

  def bilan
    # tous les dossiers
    @dossiers = Dossier.all
    @last = Dossier.last
    @count ||= @dossiers.count

    @age_moyen ||= Dossier.average(:age).round(1)
    @age_sd ||= Math.sqrt(
      Dossier.sum(
        "(age - #{@age_moyen}) * (age - #{@age_moyen})"
      ).to_f / @count
    ).round(1)
    @age_lt35 = Dossier.age_lt(35).count

    @sa_moyen ||= Dossier.average(:sa).round(1)
    @sa_sd ||= Math.sqrt(
      Dossier.sum(
        "(sa - #{@sa_moyen}) * (sa - #{@sa_moyen})"
      ).to_f / @count
    ).round(1)

    @p1g1 = Dossier.fcs_is(0).ivg_is(0).img_is(0).miu_is(0).geu_is(0).nai_is(0).count
    
    @parite = Dossier.average(:nai).round(1)
    @parite_sd ||= Math.sqrt(
      Dossier.sum(
        "(nai - #{@parite}) * (nai - #{@parite})"
      ).to_f / @count
    ).round(1)

    @gestite = Dossier.average(:gestite).round(1)
    @gestite_sd ||= Math.sqrt(
      Dossier.sum(
        "(gestite - #{@gestite}) * (gestite - #{@gestite})"
      ).to_f / @count
    ).round(1)

    # groupe solvants
    @solvants ||= Dossier.solvants
    @solv_count ||= @solvants.count

    @solvage_moyen ||= @solvants.average(:age).round(1)
    @solvage_sd ||= Math.sqrt(
      @solvants.sum(
        "(age - #{@solvage_moyen}) * (age - #{@solvage_moyen})"
      ).to_f / @solv_count
    ).round(1)
    @solvage_lt35 = @solvants.age_lt(35).count

    @solvsa_moyen ||= @solvants.average(:sa).round(1)
    @solvsa_sd ||= Math.sqrt(
      @solvants.sum(
        "(sa - #{@solvsa_moyen}) * (sa - #{@solvsa_moyen})"
      ).to_f / @solv_count
    ).round(1)

    @solv_p1g1 = @solvants.p1g1.count

    @solv_parite = @solvants.average(:nai).round(1)
    @solv_parite_sd ||= Math.sqrt(
      @solvants.sum(
        "(nai - #{@solv_parite}) * (nai - #{@solv_parite})"
      ).to_f / @solv_count
    ).round(1)

    @solv_gestite = @solvants.average(:gestite).round(1)
    @solv_gestite_sd ||= Math.sqrt(
      @solvants.sum(
        "(gestite - #{@solv_gestite}) * (gestite - #{@solv_gestite})"
      ).to_f / @count
    ).round(1)

    #produits divers
    @autres = Dossier.autres
    @autres_count = @autres.count

    @autres_age_moyen ||= @autres.average(:age).round(1)
    @autres_age_sd ||= Math.sqrt(
      @autres.sum(
        "(age - #{@autres_age_moyen}) * (age - #{@autres_age_moyen})"
      ).to_f / @autres_count
    ).round(1)
    @autres_age_lt35 = @autres.age_lt(35).count

    @autres_sa_moyen ||= @autres.average(:sa).round(1)
    @autres_sa_sd ||= Math.sqrt(
      @autres.sum(
        "(sa - #{@autres_sa_moyen}) * (sa - #{@autres_sa_moyen})"
      ).to_f / @autres_count
    ).round(1)

    @autres_p1g1 = @autres.p1g1.count

    @autres_parite = @autres.average(:nai).round(1)
    @autres_parite_sd ||= Math.sqrt(
      @autres.sum(
        "(nai - #{@autres_parite}) * (nai - #{@autres_parite})"
      ).to_f / @autres_count
    ).round(1)

    @autres_gestite = @autres.average(:gestite).round(1)
    @autres_gestite_sd ||= Math.sqrt(
      @autres.sum(
        "(gestite - #{@autres_gestite}) * (gestite - #{@autres_gestite})"
      ).to_f / @count
    ).round(1)

    @evolutions ||= Acctype.all
    @bebes ||= Bebe.all
    @niveaux ||= Niveau.all
  end
end
