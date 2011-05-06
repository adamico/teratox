class AccmodsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @accmod.save
      redirect_to accmods_url, :notice => flash_message(@accmod)
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @accmod.update_attributes(params[:accmod])
      redirect_to accmods_url, :notice => flash_message(@accmod)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @accmod.destroy
    redirect_to accmods_url, :notice => flash_message(@accmod)
  end
end
