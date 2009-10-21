require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DossiersController, "POST create" do

  describe "anonymous user" do

    it "should redirect to the login page" do
      post :create
      response.should redirect_to(login_path)
    end
  end

  it "should not execute the #create action" do
    controller.should_not_receive(:create)
    post :create
  end

  describe "authenticated user" do

    before(:each) do
      login_as_user
      @dossier = mock_model(Dossier, :save =>nil)
      Dossier.stub!(:new).and_return(@dossier)
    end

    it "should build a new dossier" do
      Dossier.should_receive(:new).
        with("n_sicap" => "LP9999997", "nom" => "Martin").
        and_return(@dossier)
      post :create, :dossier => {"n_sicap" => "LP9999997", "nom" => "Martin"}
    end

    it "should save the dossier" do
      @dossier.should_receive(:save)
      post :create
    end

    context "when the dossier saves successfully" do
      before(:each) do
        @dossier.stub!(:save).and_return true
      end

      it "should set a flash[:notice] message" do
        post :create
        flash[:notice] = "The dossier was saved successfully."
      end

      it "should redirect to the dossier view template" do
        post :create
        response.should redirect_to(dossier_path(@dossier))
      end
    end

    context "when the dossier fails to save" do
      before(:each) do
        @dossier.stub!(:save).and_return false
      end

      it "should assign @dossier" do
        post :create
        assigns[:dossier].should == @dossier
      end

      it "should render the new template" do
        post :create
        response.should render_template(:new)
      end

    end
  end
end
