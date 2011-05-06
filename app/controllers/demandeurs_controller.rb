class DemandeursController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @demandeur.save
      redirect_to demandeurs_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @demandeur.update_attributes(params[:demandeur])
      redirect_to demandeurs_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @demandeur.destroy
    redirect_to demandeurs_url, :notice => @flash_message
  end
end
