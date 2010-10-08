require 'spec_helper'

describe QualitesController do
  render_views
  before(:each) do
    @qualite = Factory(:qualite)
    @invalid_attr = { :name  => ""}
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @qualite
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :qualite => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :qualite => @qualite
    response.should redirect_to(qualite_url(assigns[:qualite]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @qualite
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @qualite, :qualite => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @qualite, :qualite => "new name"
    response.should redirect_to(qualite_url(assigns[:qualite]))
  end

  it "destroy action should destroy model and redirect to index action" do
    qualite = @qualite
    delete :destroy, :id => qualite
    response.should redirect_to(qualites_url)
    Qualite.exists?(qualite.id).should be_false
  end
end
