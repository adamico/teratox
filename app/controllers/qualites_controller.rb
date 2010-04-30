class QualitesController < ApplicationController
  def index
    @qualites = Qualite.all
  end
  
  def show
    @qualite = Qualite.find(params[:id])
  end
  
  def new
    @qualite = Qualite.new
  end
  
  def create
    @qualite = Qualite.new(params[:qualite])
    if @qualite.save
      flash[:notice] = "Successfully created qualite."
      redirect_to @qualite
    else
      render :action => 'new'
    end
  end
  
  def edit
    @qualite = Qualite.find(params[:id])
  end
  
  def update
    @qualite = Qualite.find(params[:id])
    if @qualite.update_attributes(params[:qualite])
      flash[:notice] = "Successfully updated qualite."
      redirect_to @qualite
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @qualite = Qualite.find(params[:id])
    @qualite.destroy
    flash[:notice] = "Successfully destroyed qualite."
    redirect_to qualites_url
  end
end
