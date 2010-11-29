class QualitesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @qualite.save
      redirect_to qualites_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @qualite.update_attributes(params[:qualite])
      redirect_to qualites_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @qualite.destroy
    redirect_to qualites_url, :notice => @flash_message
  end
end
