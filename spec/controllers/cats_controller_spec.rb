require 'spec_helper'

describe CatsController do
  render_views
  before(:each) do
    @cat = Factory(:cat)
    @invalid_attr = { :name  => "" }
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @cat
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :cat => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :cat => { :name => "value_for_name" }
    response.should redirect_to(cat_path(assigns[:cat]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @cat
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @cat, :cat => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @cat, :cat => { :name => "new name" }
    response.should redirect_to(cat_url(assigns[:cat]))
  end

  it "destroy action should destroy model and redirect to index action" do
    cat = @cat
    delete :destroy, :id => cat
    response.should redirect_to(cats_url)
    Cat.exists?(cat.id).should be_false
  end
end
