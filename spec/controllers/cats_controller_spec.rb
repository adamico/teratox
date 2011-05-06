require 'spec_helper'

describe CatsController do

  login_admin

  def mock_cat(stubs={})
    @mock_cat ||= mock_model(Cat, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all cats as @cats" do
      get :index
      response.should be_success
    end
  end

  describe "GET new" do
    it "assigns a new cat as @cat" do
      Cat.stub(:new) { mock_cat }
      get :new
      assigns(:cat).should be(mock_cat)
    end
  end

  describe "GET edit" do
    it "assigns the requested cat as @cat" do
      Cat.stub(:find).with("37") { mock_cat }
      get :edit, :id => "37"
      assigns(:cat).should be(mock_cat)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created cat as @cat" do
        Cat.stub(:new).with({'these' => 'params'}) { mock_cat(:save => true) }
        post :create, :cat => {'these' => 'params'}
        assigns(:cat).should be(mock_cat)
      end

      it "redirects to the cats list" do
        Cat.stub(:new) { mock_cat(:save => true) }
        post :create, :cat => {}
        response.should redirect_to(cats_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cat as @cat" do
        Cat.stub(:new).with({'these' => 'params'}) { mock_cat(:save => false) }
        post :create, :cat => {'these' => 'params'}
        assigns(:cat).should be(mock_cat)
      end

      it "re-renders the 'new' template" do
        Cat.stub(:new) { mock_cat(:save => false) }
        post :create, :cat => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cat" do
        Cat.stub(:find).with("37") { mock_cat }
        mock_cat.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cat => {'these' => 'params'}
      end

      it "assigns the requested cat as @cat" do
        Cat.stub(:find) { mock_cat(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:cat).should be(mock_cat)
      end

      it "redirects to the cats list" do
        Cat.stub(:find) { mock_cat(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(cats_url)
      end
    end

    describe "with invalid params" do
      it "assigns the cat as @cat" do
        Cat.stub(:find) { mock_cat(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:cat).should be(mock_cat)
      end

      it "re-renders the 'edit' template" do
        Cat.stub(:find) { mock_cat(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cat" do
      Cat.stub(:find).with("37") { mock_cat }
      mock_cat.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the cats list" do
      Cat.stub(:find) { mock_cat }
      delete :destroy, :id => "1"
      response.should redirect_to(cats_url)
    end
  end

end
