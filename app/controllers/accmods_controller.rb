class AccmodsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    if @accmod.save
      redirect_to @accmod, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @accmod.update_attributes(params[:accmod])
      flash[:notice] = "Successfully updated accmod."
      redirect_to @accmod, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @accmod.destroy
    flash[:notice] = "Successfully destroyed accmod."
    redirect_to accmods_url, :notice => @flash_message
  end
end
