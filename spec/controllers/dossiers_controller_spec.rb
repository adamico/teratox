require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DossiersController, "creating a new dossier" do
  integrate_views
  fixtures Dossier.all

  it "should redirect to show with a notice on successful save" do
    Dossier.any_instance.stubs(:valid?).returns(true)
    post 'create'
    assigns[:dossier].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(dossiers_path)
  end

  it "should re-render new template on failed save" do
    Dossier.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assigns[:dossier].should be_new_record
    flash[:notice].should be_nil
    response.should render_template('new')
  end

  it "should pass params to dossier" do
    post 'create', :dossier => { :nom => 'Pinco' }
    assigns[:dossier].nom.should == 'Pinco'
  end

end
