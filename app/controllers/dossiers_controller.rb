class DossiersController < ApplicationController

  def index
    @search = Dossier.search(params[:search])
    @dossiers = @search.all(:include => [ :correspondant, :acctype, :produits, { :expositions => :niveau }])
  end

  def evoluer
    @dossiers = Dossier.incomplets
  end

  def show
    @dossier = Dossier.find(params[:id], :include => [ :correspondant, :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
  end

  def new
    @dossier = Dossier.new
    @dossier.expositions.build
    @dossier.bebes.build

    @professions = Profession.all
    @niveaux = Niveau.all
    @acctypes = Acctype.all
    @accmods = Accmod.all
    @correspondants = Correspondant.all
  end

  def create
    @dossier = Dossier.new(params[:dossier])

    if @dossier.save
      flash[:notice] = "Dossier créé avec succès."
      redirect_to dossier_path(@dossier)
    else
      render :action => 'new'
    end
  end

  def edit
    @dossier = Dossier.find(params[:id], :include => [ :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
    @dossier.expositions.build
    @dossier.bebes.build
    @professions = Profession.all
    @niveaux = Niveau.all
    @acctypes = Acctype.all
    @accmods = Accmod.all
    @correspondants = Correspondant.all
  end

  def update
    @dossier = Dossier.find(params[:id])
    @dossier.attributes = params[:dossier]
    if @dossier.save
      flash[:notice] = "Dossier mis à jour avec succès."
      redirect_to @dossier
    else
       render :action => 'edit'
    end
  end

  def destroy
    @dossier = Dossier.find(params[:id])
    @dossier.destroy
    flash[:notice] = "Dossier détruit."
    redirect_to dossiers_path
  end

end
