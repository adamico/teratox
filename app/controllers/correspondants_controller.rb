class CorrespondantsController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Correspondant.accessible_by(current_ability).
      search(params[:search])
    @correspondants = @search.page(params[:page])
  end

  def names
    @correspondants = Correspondant.where(:name =~ "%#{params[:term]}%")
  end

  def show
  end

  def new
  end

  def create
    if @correspondant.save
      redirect_to correspondants_url, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @correspondant.update_attributes(params[:correspondant])
      redirect_to correspondants_url, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @correspondant.destroy
    redirect_to correspondants_url, :notice => @flash_message
  end
end
