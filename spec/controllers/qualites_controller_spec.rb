require File.dirname(__FILE__) + '/../spec_helper'
 
describe QualitesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Qualite.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Qualite.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Qualite.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(qualite_url(assigns[:qualite]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Qualite.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Qualite.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Qualite.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Qualite.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Qualite.first
    response.should redirect_to(qualite_url(assigns[:qualite]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    qualite = Qualite.first
    delete :destroy, :id => qualite
    response.should redirect_to(qualites_url)
    Qualite.exists?(qualite.id).should be_false
  end
end
