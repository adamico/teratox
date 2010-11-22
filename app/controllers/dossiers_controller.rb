# encoding:utf-8
class DossiersController < ApplicationController

  def index
    @search = Dossier.search(params[:search])
    if params[:search]
      @dossiers = @search.includes(
        :profession, :acctype, :expositions, :niveau, :cat).
        paginate(:page => params[:page], :per_page => 20)
    else
      @dossiers = Dossier.recent
    end
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
  end

  def show
    @dossier = Dossier.find(params[:id])
  end

  def new
    @dossier = Dossier.new
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
    @dossier = Dossier.find(params[:id])
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
