class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(params[:cat])
    if @cat.save
      flash[:notice] = "Successfully created cat."
      redirect_to @cat
    else
      render :action => 'new'
    end
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(params[:cat])
      flash[:notice] = "Successfully updated cat."
      redirect_to @cat
    else
      render :action => 'edit'
    end
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    flash[:notice] = "Successfully destroyed cat."
    redirect_to cats_url
  end
end
