require 'spec_helper'

describe AcctypesController do

  login_admin

  def mock_acctype(stubs={})
    @mock_acctype ||= mock_model(Acctype, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all acctypes as @acctypes" do
      get :index
      response.should be_success
    end
  end

  describe "GET new" do
    it "assigns a new acctype as @acctype" do
      Acctype.stub(:new) { mock_acctype }
      get :new
      assigns(:acctype).should be(mock_acctype)
    end
  end

  describe "GET edit" do
    it "assigns the requested acctype as @acctype" do
      Acctype.stub(:find).with("37") { mock_acctype }
      get :edit, :id => "37"
      assigns(:acctype).should be(mock_acctype)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created acctype as @acctype" do
        Acctype.stub(:new).with({'these' => 'params'}) { mock_acctype(:save => true) }
        post :create, :acctype => {'these' => 'params'}
        assigns(:acctype).should be(mock_acctype)
      end

      it "redirects to the acctypes list" do
        Acctype.stub(:new) { mock_acctype(:save => true) }
        post :create, :acctype => {}
        response.should redirect_to(acctypes_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved acctype as @acctype" do
        Acctype.stub(:new).with({'these' => 'params'}) { mock_acctype(:save => false) }
        post :create, :acctype => {'these' => 'params'}
        assigns(:acctype).should be(mock_acctype)
      end

      it "re-renders the 'new' template" do
        Acctype.stub(:new) { mock_acctype(:save => false) }
        post :create, :acctype => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested acctype" do
        Acctype.stub(:find).with("37") { mock_acctype }
        mock_acctype.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :acctype => {'these' => 'params'}
      end

      it "assigns the requested acctype as @acctype" do
        Acctype.stub(:find) { mock_acctype(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:acctype).should be(mock_acctype)
      end

      it "redirects to the acctypes list" do
        Acctype.stub(:find) { mock_acctype(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(acctypes_url)
      end
    end

    describe "with invalid params" do
      it "assigns the acctype as @acctype" do
        Acctype.stub(:find) { mock_acctype(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:acctype).should be(mock_acctype)
      end

      it "re-renders the 'edit' template" do
        Acctype.stub(:find) { mock_acctype(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested acctype" do
      Acctype.stub(:find).with("37") { mock_acctype }
      mock_acctype.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the acctypes list" do
      Acctype.stub(:find) { mock_acctype }
      delete :destroy, :id => "1"
      response.should redirect_to(acctypes_url)
    end
  end

end
