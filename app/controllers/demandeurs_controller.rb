class DemandeursController < ApplicationController
  def index
    @demandeurs = Demandeur.all
  end
  
  def show
    @demandeur = Demandeur.find(params[:id])
  end
  
  def new
    @demandeur = Demandeur.new
  end
  
  def create
    @demandeur = Demandeur.new(params[:demandeur])
    if @demandeur.save
      flash[:notice] = "Successfully created demandeur."
      redirect_to @demandeur
    else
      render :action => 'new'
    end
  end
  
  def edit
    @demandeur = Demandeur.find(params[:id])
  end
  
  def update
    @demandeur = Demandeur.find(params[:id])
    if @demandeur.update_attributes(params[:demandeur])
      flash[:notice] = "Successfully updated demandeur."
      redirect_to @demandeur
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @demandeur = Demandeur.find(params[:id])
    @demandeur.destroy
    flash[:notice] = "Successfully destroyed demandeur."
    redirect_to demandeurs_url
  end
end
