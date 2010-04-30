class AccmodsController < ApplicationController
  def index
    @accmods = Accmod.all
  end
  
  def show
    @accmod = Accmod.find(params[:id])
  end
  
  def new
    @accmod = Accmod.new
  end
  
  def create
    @accmod = Accmod.new(params[:accmod])
    if @accmod.save
      flash[:notice] = "Successfully created accmod."
      redirect_to @accmod
    else
      render :action => 'new'
    end
  end
  
  def edit
    @accmod = Accmod.find(params[:id])
  end
  
  def update
    @accmod = Accmod.find(params[:id])
    if @accmod.update_attributes(params[:accmod])
      flash[:notice] = "Successfully updated accmod."
      redirect_to @accmod
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @accmod = Accmod.find(params[:id])
    @accmod.destroy
    flash[:notice] = "Successfully destroyed accmod."
    redirect_to accmods_url
  end
end
