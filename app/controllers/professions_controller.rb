class ProfessionsController < ApplicationController
  def index
    @professions = Profession.all
  end

  def show
    @profession = Profession.find(params[:id])
  end

  def new
    @profession = Profession.new
  end

  def edit
    @profession = Profession.find(params[:id])
  end

  def create
    @profession = Profession.new(params[:profession])

    if @profession.save
      flash[:notice] = 'Profession was successfully created.'
      redirect_to @profession
    else
      render :action => "new"
    end
  end

  def update
    @profession = Profession.find(params[:id])

    if @profession.update_attributes(params[:profession])
      flash[:notice] = 'Profession was successfully updated.'
      redirect_to @profession
    else
      render :action => "edit"
    end
  end

  def destroy
    @profession = Profession.find(params[:id])
    @profession.destroy
    flash[:notice] = "Successfully destroyed profession."
    redirect_to professions_url
  end
end
