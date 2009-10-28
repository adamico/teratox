require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProduitsController, "Get new" do
  should_require_login :get, :new
  
  describe "anonymous user" do
    it "should redirect to the login page" do
      get :new
      response.should redirect_to(login_path)
    end
    it "should not call the #new action" do
      controller.should_not_receive(:new)
      get :new
    end
  end

  describe "authenticated user" do
    before(:each) do
      login_as_user
      @produit = mock_model(Produit)
      Produit.stub!(:new).and_return @produit
    end
    it "should build a produit" do
      Produit.should_receive(:new)
      get :new
    end
    it "should assign @produit" do
      get :new
      assigns[:produit].should == @produit
    end
    it "should render the new template" do
      get :new
      response.should render_template(:new)
    end
  end
end
