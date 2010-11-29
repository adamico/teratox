class ProduitsController < ApplicationController
  load_and_authorize_resource

  def index
    @produits = Produit.paginate :page => params[:page], :order => "LOWER(name) ASC"
  end

  def names
    @produits = Produit.where(:name =~ "%#{params[:term]}%")
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @produit.save
      redirect_to @produit, :notice => @flash_message
    else
      render :action => "new"
    end
  end

  def update
    if @produit.update_attributes(params[:produit])
      redirect_to @produit, :notice => @flash_message
    else
      render :action => "edit"
    end
  end

  def destroy
    @produit.destroy

    redirect_to produits_url, :notice => @flash_message
  end
end
