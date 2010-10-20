class PathologiesController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        root = Pathologie.find(params[:parent_id]) rescue nil
        nodes = root ? root.children : Pathologie.roots

        node_hashes = nodes.map do |node|
          node_hash = {
            :attr => { :id => node.id, :libelle => node.libelle }
          }

          node_hash[:data] = node.libabr.nil? ?
            {:title => node.libelle} :
            {:title => node.libabr + " - " + node.libelle}
          node_hash[:state] = 'closed' if node.has_children?
          node_hash
        end

        render :json => node_hashes
      end
    end
  end

  def libelles
    @pathologies = Pathologie.where(:libelle =~ "%#{params[:term]}%")
  end
  
  def show
    @pathologie = Pathologie.find(params[:id])
  end
  
  def new
    @pathologie = Pathologie.new
  end
  
  def create
    @pathologie = Pathologie.new(params[:pathologie])
    if @pathologie.save
      flash[:notice] = "Successfully created pathologie."
      redirect_to @pathologie
    else
      render :action => 'new'
    end
  end
  
  def edit
    @pathologie = Pathologie.find(params[:id])
  end
  
  def update
    @pathologie = Pathologie.find(params[:id])
    if @pathologie.update_attributes(params[:pathologie])
      flash[:notice] = "Successfully updated pathologie."
      redirect_to @pathologie
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @pathologie = Pathologie.find(params[:id])
    @pathologie.destroy
    flash[:notice] = "Successfully destroyed pathologie."
    redirect_to pathologies_url
  end
end
