class ProfessionsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @profession.save
      redirect_to professions_url, :notice => @flash_message
    else
      render :action => "new"
    end
  end

  def update
    if @profession.update_attributes(params[:profession])
      redirect_to professions_url, :notice => @flash_message
    else
      render :action => "edit"
    end
  end

  def destroy
    @profession.destroy
    redirect_to professions_url, :notice => @flash_message
  end
end
