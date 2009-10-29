class DossiersController < ApplicationController

  def index
    @dossiers = Dossier.all(:order => "date_appel DESC")
  end

  def evoluer
    @dossiers = Dossier.incomplets
    if @dossiers.empty?
      flash[:notice] = "Toutes les évolutions ont été faites."
      redirect_to :back
    end
  end

  def show
    @dossier = Dossier.find(params[:id], :include => [ :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
  end

  def new
    @dossier = Dossier.new

    @professions = Profession.all
    @niveaux = Niveau.all
    @acctypes = Acctype.all
    @accmods = Accmod.all
  end

  def create
    @dossier = Dossier.new(params[:dossier])

    if @dossier.save
      flash[:notice] = "The dossier was saved successfully."
      redirect_to dossier_path(@dossier)
    else
      render :action => 'new'
    end
  end

  def edit
    @dossier = Dossier.find(params[:id], :include => [ :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
    @dossier.expositions.build
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
