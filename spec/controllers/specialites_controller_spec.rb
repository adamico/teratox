require File.dirname(__FILE__) + '/../spec_helper'
 
describe SpecialitesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Specialite.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Specialite.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Specialite.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(specialite_url(assigns[:specialite]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Specialite.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Specialite.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Specialite.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Specialite.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Specialite.first
    response.should redirect_to(specialite_url(assigns[:specialite]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    specialite = Specialite.first
    delete :destroy, :id => specialite
    response.should redirect_to(specialites_url)
    Specialite.exists?(specialite.id).should be_false
  end
end
