class AcctypesController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @acctype.save
      redirect_to @acctype, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @acctype.update_attributes(params[:acctype])
      redirect_to @acctype, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @acctype.destroy
    redirect_to acctypes_url, :notice => @flash_message
  end
end
