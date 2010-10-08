require 'spec_helper'
 
describe DemandeursController do
  render_views
  before(:each) do
    @demandeur = Factory(:demandeur)
    @invalid_attr = { :name  => "" }
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @demandeur
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :demandeur => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :demandeur => { :name => "value for name" }
    response.should redirect_to(demandeur_url(assigns[:demandeur]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @demandeur
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @demandeur, :demandeur => @invalid_attr 
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @demandeur, :demandeur => { :name => "new name" }
    response.should redirect_to(demandeur_url(assigns[:demandeur]))
  end

  it "destroy action should destroy model and redirect to index action" do
    demandeur = @demandeur
    delete :destroy, :id => demandeur
    response.should redirect_to(demandeurs_url)
    Demandeur.exists?(demandeur.id).should be_false
  end
end
