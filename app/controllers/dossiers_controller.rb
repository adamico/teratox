class DossiersController < ApplicationController
  def index
    @dossiers = Dossier.all(:order => "date_appel DESC")
    @dossier_years = @dossiers.group_by { |d| d.date_appel.beginning_of_year }
  end

  def show
    @dossier = Dossier.find(params[:id], :include => [ :profession, { :expositions => :niveau }, :produits, :bebes ])
  end

  def new
    @dossier = Dossier.new
    @dossier.expositions.build
    @dossier.bebes.build

    @professions = Profession.all
    @niveaux = Niveau.all
    @acctypes = Acctype.all
    @accmods = Accmod.all
  end

  def create
    @dossier = Dossier.new(params[:dossier])

    if @dossier.save
      flash[:notice] = "Dossier was successfully created."
      redirect_to @dossier
    else
      render :action => 'new'
    end
  end

  def edit
    @dossier = Dossier.find(params[:id], :include => [ :profession, { :expositions => :niveau }, :produits, :bebes ])
    @professions = Profession.all
    @niveaux = Niveau.all
    @acctypes = Acctype.all
    @accmods = Accmod.all
  end

  def update
    @dossier = Dossier.find(params[:id])
    @dossier.attributes = params[:dossier]
    if @dossier.save
      flash[:notice] = "Successfully updated dossier."
      redirect_to @dossier
    else
       render :action => 'edit'
    end
  end

  def destroy
    @dossier = Dossier.find(params[:id])
    @dossier.destroy
    flash[:notice] = "Successfully destroyed dossier."
    redirect_to dossiers_path
  end
end
