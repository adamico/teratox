require 'spec_helper'

describe DossiersController do

  login_admin

  def mock_dossier(stubs={})
    @mock_dossier ||= mock_model(Dossier, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all dossiers as @dossiers" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested dossier as @dossier" do
      Dossier.stub(:find).with("37") { mock_dossier }
      get :show, :id => "37"
      assigns(:dossier).should be(mock_dossier)
    end
  end

  describe "GET new" do
    it "assigns a new dossier as @dossier" do
      Dossier.stub(:new) { mock_dossier }
      get :new
      assigns(:dossier).should be(mock_dossier)
    end
  end

  describe "GET edit" do
    it "assigns the requested dossier as @dossier" do
      Dossier.stub(:find).with("37") { mock_dossier }
      get :edit, :id => "37"
      assigns(:dossier).should be(mock_dossier)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created dossier as @dossier" do
        Dossier.stub(:new).with({'these' => 'params'}) { mock_dossier(:save => true) }
        post :create, :dossier => {'these' => 'params'}
        assigns(:dossier).should be(mock_dossier)
      end

      it "redirects to the created dossier" do
        Dossier.stub(:new) { mock_dossier(:save => true) }
        post :create, :dossier => {}
        response.should redirect_to(dossier_url(mock_dossier))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved dossier as @dossier" do
        Dossier.stub(:new).with({'these' => 'params'}) { mock_dossier(:save => false) }
        post :create, :dossier => {'these' => 'params'}
        assigns(:dossier).should be(mock_dossier)
      end

      it "re-renders the 'new' template" do
        Dossier.stub(:new) { mock_dossier(:save => false) }
        post :create, :dossier => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested dossier" do
        Dossier.stub(:find).with("37") { mock_dossier }
        mock_dossier.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :dossier => {'these' => 'params'}
      end

      it "assigns the requested dossier as @dossier" do
        Dossier.stub(:find) { mock_dossier(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:dossier).should be(mock_dossier)
      end

      it "redirects to the dossier" do
        Dossier.stub(:find) { mock_dossier(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(dossier_url(mock_dossier))
      end
    end

    describe "with invalid params" do
      it "assigns the dossier as @dossier" do
        Dossier.stub(:find) { mock_dossier(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:dossier).should be(mock_dossier)
      end

      it "re-renders the 'edit' template" do
        Dossier.stub(:find) { mock_dossier(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested dossier" do
      Dossier.stub(:find).with("37") { mock_dossier }
      mock_dossier.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the dossiers list" do
      Dossier.stub(:find) { mock_dossier }
      delete :destroy, :id => "1"
      response.should redirect_to(dossiers_url)
    end
  end

end
