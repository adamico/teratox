require 'spec_helper'

describe CorrespondantsController do

  login_admin

  def mock_correspondant(stubs={})
    @mock_correspondant ||= mock_model(Correspondant, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all correspondants as @correspondants" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested correspondant as @correspondant" do
      Correspondant.stub(:find).with("37") { mock_correspondant }
      get :show, :id => "37"
      assigns(:correspondant).should be(mock_correspondant)
    end
  end

  describe "GET new" do
    it "assigns a new correspondant as @correspondant" do
      Correspondant.stub(:new) { mock_correspondant }
      get :new
      assigns(:correspondant).should be(mock_correspondant)
    end
  end

  describe "GET edit" do
    it "assigns the requested correspondant as @correspondant" do
      Correspondant.stub(:find).with("37") { mock_correspondant }
      get :edit, :id => "37"
      assigns(:correspondant).should be(mock_correspondant)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created correspondant as @correspondant" do
        Correspondant.stub(:new).with({'these' => 'params'}) { mock_correspondant(:save => true) }
        post :create, :correspondant => {'these' => 'params'}
        assigns(:correspondant).should be(mock_correspondant)
      end

      it "redirects to the correspondants list" do
        Correspondant.stub(:new) { mock_correspondant(:save => true) }
        post :create, :correspondant => {}
        response.should redirect_to(correspondants_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved correspondant as @correspondant" do
        Correspondant.stub(:new).with({'these' => 'params'}) { mock_correspondant(:save => false) }
        post :create, :correspondant => {'these' => 'params'}
        assigns(:correspondant).should be(mock_correspondant)
      end

      it "re-renders the 'new' template" do
        Correspondant.stub(:new) { mock_correspondant(:save => false) }
        post :create, :correspondant => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested correspondant" do
        Correspondant.stub(:find).with("37") { mock_correspondant }
        mock_correspondant.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :correspondant => {'these' => 'params'}
      end

      it "assigns the requested correspondant as @correspondant" do
        Correspondant.stub(:find) { mock_correspondant(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:correspondant).should be(mock_correspondant)
      end

      it "redirects to the correspondants list" do
        Correspondant.stub(:find) { mock_correspondant(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(correspondants_url)
      end
    end

    describe "with invalid params" do
      it "assigns the correspondant as @correspondant" do
        Correspondant.stub(:find) { mock_correspondant(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:correspondant).should be(mock_correspondant)
      end

      it "re-renders the 'edit' template" do
        Correspondant.stub(:find) { mock_correspondant(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested correspondant" do
      Correspondant.stub(:find).with("37") { mock_correspondant }
      mock_correspondant.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the correspondants list" do
      Correspondant.stub(:find) { mock_correspondant }
      delete :destroy, :id => "1"
      response.should redirect_to(correspondants_url)
    end
  end

end
