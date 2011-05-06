class CatsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @cat.save
      redirect_to cats_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @cat.update_attributes(params[:cat])
      redirect_to cats_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cat.destroy
    redirect_to cats_url, :notice => @flash_message
  end
end
