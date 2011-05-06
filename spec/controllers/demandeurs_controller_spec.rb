require 'spec_helper'

describe DemandeursController do

  login_admin

  def mock_demandeur(stubs={})
    @mock_demandeur ||= mock_model(Demandeur, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all demandeurs as @demandeurs" do
      get :index
      response.should be_success
    end
  end

  describe "GET show" do
    it "assigns the requested demandeur as @demandeur" do
      Demandeur.stub(:find).with("37") { mock_demandeur }
      get :show, :id => "37"
      assigns(:demandeur).should be(mock_demandeur)
    end
  end

  describe "GET new" do
    it "assigns a new demandeur as @demandeur" do
      Demandeur.stub(:new) { mock_demandeur }
      get :new
      assigns(:demandeur).should be(mock_demandeur)
    end
  end

  describe "GET edit" do
    it "assigns the requested demandeur as @demandeur" do
      Demandeur.stub(:find).with("37") { mock_demandeur }
      get :edit, :id => "37"
      assigns(:demandeur).should be(mock_demandeur)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created demandeur as @demandeur" do
        Demandeur.stub(:new).with({'these' => 'params'}) { mock_demandeur(:save => true) }
        post :create, :demandeur => {'these' => 'params'}
        assigns(:demandeur).should be(mock_demandeur)
      end

      it "redirects to the created demandeur" do
        Demandeur.stub(:new) { mock_demandeur(:save => true) }
        post :create, :demandeur => {}
        response.should redirect_to(demandeurs_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved demandeur as @demandeur" do
        Demandeur.stub(:new).with({'these' => 'params'}) { mock_demandeur(:save => false) }
        post :create, :demandeur => {'these' => 'params'}
        assigns(:demandeur).should be(mock_demandeur)
      end

      it "re-renders the 'new' template" do
        Demandeur.stub(:new) { mock_demandeur(:save => false) }
        post :create, :demandeur => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested demandeur" do
        Demandeur.stub(:find).with("37") { mock_demandeur }
        mock_demandeur.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :demandeur => {'these' => 'params'}
      end

      it "assigns the requested demandeur as @demandeur" do
        Demandeur.stub(:find) { mock_demandeur(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:demandeur).should be(mock_demandeur)
      end

      it "redirects to the demandeur" do
        Demandeur.stub(:find) { mock_demandeur(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(demandeurs_url)
      end
    end

    describe "with invalid params" do
      it "assigns the demandeur as @demandeur" do
        Demandeur.stub(:find) { mock_demandeur(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:demandeur).should be(mock_demandeur)
      end

      it "re-renders the 'edit' template" do
        Demandeur.stub(:find) { mock_demandeur(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested demandeur" do
      Demandeur.stub(:find).with("37") { mock_demandeur }
      mock_demandeur.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the demandeurs list" do
      Demandeur.stub(:find) { mock_demandeur }
      delete :destroy, :id => "1"
      response.should redirect_to(demandeurs_url)
    end
  end

end
