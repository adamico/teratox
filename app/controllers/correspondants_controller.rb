class CorrespondantsController < ApplicationController
  def index
    @correspondants = Correspondant.all
  end
  
  def new
    @correspondant = Correspondant.new
  end
  
  def create
    @correspondant = Correspondant.new(params[:correspondant])
    if @correspondant.save
      flash[:notice] = "Successfully created correspondant."
      redirect_to correspondants_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @correspondant = Correspondant.find(params[:id])
  end
  
  def update
    @correspondant = Correspondant.find(params[:id])
    if @correspondant.update_attributes(params[:correspondant])
      flash[:notice] = "Successfully updated correspondant."
      redirect_to correspondants_url
    else
      render :action => 'edit'
    end
  end
end
