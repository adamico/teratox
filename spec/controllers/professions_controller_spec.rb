require 'spec_helper'
 
describe ProfessionsController do
  render_views
  before(:each) do
    @profession = Factory(:profession)
    @invalid_attr = { :name  => ""}
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @profession
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    post :create, :profession => @invalid_attr
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    post :create, :profession => { :name => "value_for_name" }
    response.should redirect_to(profession_path(assigns[:profession]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @profession
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    put :update, :id => @profession, :profession => @invalid_attr
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    put :update, :id => @profession, :profession => @profession
    response.should redirect_to(profession_path(assigns[:profession]))
  end

  it "destroy action should destroy model and redirect to index action" do
    profession = @profession
    delete :destroy, :id => profession
    response.should redirect_to(professions_url)
    Profession.exists?(profession.id).should be_false
  end
end
