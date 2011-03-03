class MalformationsController < ApplicationController
  load_and_authorize_resource

  before_filter :find_parents, :only => [:new, :edit]

  def index
    respond_to do |format|
      format.html
      format.json do
        root = Malformation.find(params[:parent_id]) rescue nil
        nodes = root ? root.children : Malformation.roots

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
    @malformations = Malformation.where(:libelle =~ "%#{params[:term]}%")
  end

  def show
  end

  def new
  end

  def create
    if @malformation.save
      redirect_to @malformation, :notice => @flash_message
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @malformation.update_attributes(params[:malformation])
      redirect_to @malformation, :notice => @flash_message
    else
      render :action => 'edit'
    end
  end

  def destroy
    @malformation.destroy
    redirect_to malformations_url, :notice => @flash_message
  end

  private

  def find_parents
    @parents = Malformation.all
  end
end
