class DossiersController < ApplicationController
  load_and_authorize_resource

  helper_method :date_appel, :ddr, :dg, :dap, :dra,
                :demandeurs, :cats,
                :niveaux, :acctypes, :accmods,
                :professions, :specialites, :produits

  def index
    @dossiers = Dossier.accessible_by(current_ability).recent
  end

  def search
    @q = Dossier.accessible_by(current_ability).search(params[:q])
    if params[:q]
      @dossiers = @q.result.includes(
        :profession, :acctype, :expositions, :niveau, :cat).
        page(params[:page])
    else
      @dossiers = Dossier.accessible_by(current_ability).recent
    end
    respond_to do |format|
      format.html
      format.csv do
        @dossiers = @q.result
        @outfile = "dossiers_" + Time.now.strftime("%d-%m-%Y") + ".csv"
        response.headers["Content-Type"] = "text/csv; charset=UTF-8; header=present"
        response.headers["Content-Disposition"] = "attachment; filename=#{@outfile}"
      end
    end
  end

  def evoluer
    @dossiers = Dossier.incomplets
  end

  def show
  end

  def new
  end

  def create
    if @dossier.save
      redirect_with_flash(@dossier)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dossier.attributes = params[:dossier]
    if @dossier.save
      redirect_with_flash(@dossier)
    else
       render :edit
    end
  end

  def destroy
    @dossier.destroy
    redirect_to dossiers_path, :notice => @flash_message
  end

  private

  def professions
    @professions ||= Profession.all
  end
  def specialites
    @specialites ||= Specialite.all
  end
  def demandeurs
    @demandeurs ||= Demandeur.all
  end
  def produits
    @produits ||= Produit.all
  end
  def niveaux
    @niveaux ||= Niveau.all
  end
  def cats
    @cats ||= Cat.all
  end
  def acctypes
    @acctypes ||= Acctype.all
  end

  def accmods
    @accmods ||= Accmod.all
  end

  def date_appel
    @date_appel ||= (params[:id] && @dossier.date_appel?) ? l(@dossier.date_appel) : ""
  end

  def ddr
    @ddr ||= (params[:id] && @dossier.ddr?) ? l(@dossier.ddr) : ""
  end

  def dg
    @dg ||= (params[:id] && @dossier.dg?) ? l(@dossier.dg) : ""
  end

  def dap
    @dap ||= (params[:id] && @dossier.dap?) ? l(@dossier.dap) : ""
  end

  def dra
    @dra ||= (params[:id] && @dossier.dra?) ? l(@dossier.dra) : " "
  end
end
