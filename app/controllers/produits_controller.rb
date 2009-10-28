class ProduitsController < ApplicationController

  before_filter :login_required

  def index
    @produits = Produit.find(:all, :conditions => ['name LIKE ?', "%#{params[:search]}%"])
  end

  def show
    @produit = Produit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @produit }
    end
  end

  def new
    @produit = Produit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @produit }
    end
  end

  def edit
    @produit = Produit.find(params[:id])
  end

  def create
    @produit = Produit.new(params[:produit])

    respond_to do |format|
      if @produit.save
        flash[:notice] = 'Produit was successfully created.'
        format.html { redirect_to(@produit) }
        format.xml  { render :xml => @produit, :status => :created, :location => @produit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @produit.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @produit = Produit.find(params[:id])

    respond_to do |format|
      if @produit.update_attributes(params[:produit])
        flash[:notice] = 'Produit was successfully updated.'
        format.html { redirect_to(@produit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @produit.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @produit = Produit.find(params[:id])
    @produit.destroy

    respond_to do |format|
      format.html { redirect_to(produits_url) }
      format.xml  { head :ok }
    end
  end
end
