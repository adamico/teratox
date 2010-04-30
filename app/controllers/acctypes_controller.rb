class AcctypesController < ApplicationController
  def index
    @acctypes = Acctype.all
  end
  
  def show
    @acctype = Acctype.find(params[:id])
  end
  
  def new
    @acctype = Acctype.new
  end
  
  def create
    @acctype = Acctype.new(params[:acctype])
    if @acctype.save
      flash[:notice] = "Successfully created acctype."
      redirect_to @acctype
    else
      render :action => 'new'
    end
  end
  
  def edit
    @acctype = Acctype.find(params[:id])
  end
  
  def update
    @acctype = Acctype.find(params[:id])
    if @acctype.update_attributes(params[:acctype])
      flash[:notice] = "Successfully updated acctype."
      redirect_to @acctype
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @acctype = Acctype.find(params[:id])
    @acctype.destroy
    flash[:notice] = "Successfully destroyed acctype."
    redirect_to acctypes_url
  end
end
