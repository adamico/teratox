class MalformationsController < ApplicationController
  def index
    @malformations = Malformation.all
  end
  
  def show
    @malformation = Malformation.find(params[:id])
  end
  
  def new
    @malformation = Malformation.new
  end
  
  def create
    @malformation = Malformation.new(params[:malformation])
    if @malformation.save
      flash[:notice] = "Successfully created malformation."
      redirect_to @malformation
    else
      render :action => 'new'
    end
  end
  
  def edit
    @malformation = Malformation.find(params[:id])
  end
  
  def update
    @malformation = Malformation.find(params[:id])
    if @malformation.update_attributes(params[:malformation])
      flash[:notice] = "Successfully updated malformation."
      redirect_to @malformation
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @malformation = Malformation.find(params[:id])
    @malformation.destroy
    flash[:notice] = "Successfully destroyed malformation."
    redirect_to malformations_url
  end
end
