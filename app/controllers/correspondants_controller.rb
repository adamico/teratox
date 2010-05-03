# encoding:utf-8
class CorrespondantsController < ApplicationController
  def index
    @search = Correspondant.search(params[:search])
    @correspondants = @search.all(:order => "LOWER(name) ASC").paginate :page => params[:page]

  end

  def show
    @correspondant = Correspondant.find(params[:id], :include => :dossiers)

    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @correspondant }
    end
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

  def destroy
    @correspondant = Correspondant.find(params[:id])
    @correspondant.destroy
    flash[:notice] = "Correspondant détruit."
    redirect_to correspondants_path
  end
end
