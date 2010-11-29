class DossiersController < ApplicationController
  load_and_authorize_resource

  def index
    @search = Dossier.accessible_by(current_ability).search(params[:search])
    if params[:search]
      @dossiers = @search.includes(
        :profession, :acctype, :expositions, :niveau, :cat).
        paginate(:page => params[:page], :per_page => 20)
    else
      @dossiers = Dossier.accessible_by(current_ability).recent
    end
    respond_to do |format|
      format.html
      format.csv do
        @dossiers = @search.all
        @outfile = "dossiers_" + Time.now.strftime("%d-%m-%Y") + ".csv"
        response.headers["Content-Type"] = "text/csv; charset=UTF-8; header=present"
        response.headers["Content-Disposition"] = "attachment; filename=#{@outfile}"
      end
    end
  end

  def evoluer
    @dossiers = Dossier.incomplets
  end

  def show
  end

  def new
  end

  def create
    if @dossier.save
      redirect_to dossier_path(@dossier), :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    @dossier.attributes = params[:dossier]
    if @dossier.save
      redirect_to @dossier, :notice => @flash_message
    else
       render :action => 'edit'
    end
  end

  def destroy
    @dossier.destroy
    redirect_to dossiers_path, :notice => @flash_message
  end
end
