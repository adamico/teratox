class PathologiesController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
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
  end

  def new
  end

  def create
    if @pathologie.save
      redirect_to @pathologie, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @pathologie.update_attributes(params[:pathologie])
      redirect_to @pathologie, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @pathologie.destroy
    redirect_to pathologies_url, :notice => @flash_message
  end
end
