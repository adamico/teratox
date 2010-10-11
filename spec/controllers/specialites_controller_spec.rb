require 'spec_helper'
 
describe SpecialitesController do
  render_views
  before(:each) do
    @specialite = Factory(:specialite)
    @invalid_attr = { :name  => ""}
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @specialite
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :specialite => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :specialite => { :name => "value for name"}
    response.should redirect_to(specialite_url(assigns[:specialite]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @specialite
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @specialite, :specialite => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @specialite, :specialite => {:name => "new name"}
    response.should redirect_to(specialite_url(assigns[:specialite]))
  end

  it "destroy action should destroy model and redirect to index action" do
    specialite = @specialite
    delete :destroy, :id => specialite
    response.should redirect_to(specialites_url)
    Specialite.exists?(specialite.id).should be_false
  end
end
