class DossiersController < ApplicationController
  def index
    @dossiers = Dossier.all(:order => "date_appel DESC", :include => [ :acctype, :produits, { :expositions => :niveau } ] )
    @dossier_years = @dossiers.group_by { |d| d.date_appel.beginning_of_year }
  end

  def evoluer
    @dossiers = Dossier.incomplets
    if @dossiers.empty?
      flash[:notice] = "Tous les évolutions ont été faites."
      redirect_to :back
    end
  end

  def search
    @result = Dossier.find_by_n_sicap(params[:n_sicap])
    if @result.nil?
      flash[:notice] = "No record found for #{params[:n_sicap]}"
      redirect_to :back
    else
      redirect_to :action => "show", :id => @result.id
    end
  end

  def show
    @dossier = Dossier.find(params[:id], :include => [ :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
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
    @dossier = Dossier.find(params[:id], :include => [ :profession, :acctype, :accmod, { :expositions => :niveau }, :produits, :bebes ])
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
