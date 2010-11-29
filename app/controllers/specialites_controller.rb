class SpecialitesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @specialite.save
      redirect_to specialites_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @specialite.update_attributes(params[:specialite])
      redirect_to specialites_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @specialite.destroy
    redirect_to specialites_url, :notice => @flash_message
  end
end
