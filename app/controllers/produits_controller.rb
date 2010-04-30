class ProduitsController < ApplicationController

  def index
    params[:search] ||= {}
    @produits = Produit.paginate :page => params[:page], :order => "LOWER(name) ASC"
  end

  def show
    @produit = Produit.find(params[:id])
  end

  def new
    @produit = Produit.new
  end

  def edit
    @produit = Produit.find(params[:id])
  end

  def create
    @produit = Produit.new(params[:produit])
    if @produit.save
      flash[:notice] = 'The produit was saved successfully.'
      redirect_to(@produit)
    else
      render :action => "new"
    end
  end

  def update
    @produit = Produit.find(params[:id])
    if @produit.update_attributes(params[:produit])
      flash[:notice] = 'Produit was successfully updated.'
      redirect_to(@produit)
    else
      render :action => "edit"
    end
  end

  def destroy
    @produit = Produit.find(params[:id])
    @produit.destroy

    flash[:notice] = "Successfully destroyed produit."
    redirect_to(produits_url)
  end
end
