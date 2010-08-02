class AccmodsController < ApplicationController
  before_filter :find_accmod, :only => [:show, :edit, :update, :destroy]

  def index
    @accmods = Accmod.all
  end
  
  def show
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
  end
  
  def update
    if @accmod.update_attributes(params[:accmod])
      flash[:notice] = "Successfully updated accmod."
      redirect_to @accmod
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @accmod.destroy
    flash[:notice] = "Successfully destroyed accmod."
    redirect_to accmods_url
  end

  protected

  def find_accmod
    @accmod = Accmod.find(params[:id])
  end
end
