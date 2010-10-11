require 'spec_helper'
 
describe AccmodsController do
  render_views
  before(:each) do
    @accmod = Factory(:accmod)
    @invalid_attr = {:name => ""}
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @accmod
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :accmod => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :accmod => { :name => "value_for_name" }
    response.should redirect_to(accmod_path(assigns[:accmod]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @accmod
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @accmod, :accmod => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @accmod, :accmod => { :name => "new name"}
    response.should redirect_to(accmod_path(assigns[:accmod]))
  end

  it "destroy action should destroy model and redirect to index action" do
    accmod = @accmod
    delete :destroy, :id => accmod
    response.should redirect_to(accmods_url)
    Accmod.exists?(@accmod.id).should be_false
  end
end
