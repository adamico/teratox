require 'spec_helper'

describe CorrespondantsController do
  render_views
  before(:each) do
    @correspondant = Factory(:correspondant)
    @invalid_attr = { :name  => "" }
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @correspondant
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :correspondant => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :correspondant => { :name => "value_for_name" }
    response.should redirect_to(correspondants_url)
  end

  it "edit action should render edit template" do
    get :edit, :id => @correspondant
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @correspondant, :correspondant => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @correspondant, :correspondant => { :name => "new name" }
    response.should redirect_to(correspondants_url)
  end

  it "destroy action should destroy model and redirect to index action" do
    correspondant = @correspondant
    delete :destroy, :id => correspondant
    response.should redirect_to(correspondants_url)
    Correspondant.exists?(correspondant.id).should be_false
  end
end
