class DossiersController < ApplicationController
  load_and_authorize_resource

  before_filter :find_niveaux, :only => [:new, :edit]
  before_filter :find_acctypes, :only => [:index, :evoluer]

  def index
    @search = Dossier.accessible_by(current_ability).search(params[:search])
    if params[:search]
      @dossiers = @search.includes(
        :profession, :acctype, :expositions, :niveau, :cat).
        paginate(:page => params[:page], :per_page => 20)
    else
      @dossiers = Dossier.accessible_by(current_ability).recent
    end
    @professions = Profession.all
    @specialites = Specialite.all
    @produits = Produit.all
    @niveaux= Niveau.all
    respond_to do |format|
      format.html
      format.csv do
        @dossiers = @search.all
        @outfile = "dossiers_" + Time.now.strftime("%d-%m-%Y") + ".csv"
        response.headers["Content-Type"] = "text/csv; charset=UTF-8; header=present"
        response.headers["Content-Disposition"] = "attachment; filename=#{@outfile}"
      end
    end
  end

  def evoluer
    @dossiers = Dossier.incomplets
    @accmods = Accmod.all
  end

  def show
  end

  def new
  end

  def create
    if @dossier.save
      redirect_to dossier_path(@dossier), :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    @dossier.attributes = params[:dossier]
    if @dossier.save
      redirect_to @dossier, :notice => @flash_message
    else
       render :action => 'edit'
    end
  end

  def destroy
    @dossier.destroy
    redirect_to dossiers_path, :notice => @flash_message
  end

  private

  def find_niveaux
    @niveaux = Niveau.all
  end

  def find_acctypes
    @acctypes = Acctype.all
  end
end
