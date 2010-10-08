require 'spec_helper'

describe NiveauxController do
  render_views
  before(:each) do
    @niveau = Factory(:niveau)
    @invalid_attr = { :name => "" }
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @niveau
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :niveau => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :niveau => { :name => "value for name" }
    response.should redirect_to(niveau_url(assigns[:niveau]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => @niveau
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    put :update, :id => @niveau, :niveau => @invalid_attr
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    put :update, :id => @niveau, :niveau => { :name => "new name" }
    response.should redirect_to(niveau_url(assigns[:niveau]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    niveau = @niveau
    delete :destroy, :id => niveau
    response.should redirect_to(niveaux_url)
    Niveau.exists?(niveau.id).should be_false
  end
end
