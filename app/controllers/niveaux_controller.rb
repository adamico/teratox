class NiveauxController < ApplicationController
  def index
    @niveaux = Niveau.all
  end
  
  def show
    @niveau = Niveau.find(params[:id])
  end
  
  def new
    @niveau = Niveau.new
  end
  
  def create
    @niveau = Niveau.new(params[:niveau])
    if @niveau.save
      flash[:notice] = "Successfully created niveau."
      redirect_to @niveau
    else
      render :action => 'new'
    end
  end
  
  def edit
    @niveau = Niveau.find(params[:id])
  end
  
  def update
    @niveau = Niveau.find(params[:id])
    if @niveau.update_attributes(params[:niveau])
      flash[:notice] = "Successfully updated niveau."
      redirect_to @niveau
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @niveau = Niveau.find(params[:id])
    @niveau.destroy
    flash[:notice] = "Successfully destroyed niveau."
    redirect_to niveaux_url
  end
end
