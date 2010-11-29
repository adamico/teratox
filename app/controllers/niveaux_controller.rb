class NiveauxController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @niveau.save
      redirect_to niveaux_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @niveau.update_attributes(params[:niveau])
      redirect_to niveaux_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @niveau.destroy
    redirect_to niveaux_url, :notice => @flash_message
  end
end
