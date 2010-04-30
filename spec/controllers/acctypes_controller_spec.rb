require File.dirname(__FILE__) + '/../spec_helper'
 
describe AcctypesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Acctype.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Acctype.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Acctype.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(acctype_url(assigns[:acctype]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Acctype.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Acctype.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Acctype.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    Acctype.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Acctype.first
    response.should redirect_to(acctype_url(assigns[:acctype]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    acctype = Acctype.first
    delete :destroy, :id => acctype
    response.should redirect_to(acctypes_url)
    Acctype.exists?(acctype.id).should be_false
  end
end
