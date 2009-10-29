require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DossiersController do
  mock_models :dossier

  describe :get => :index do
    expects :all, :on => Dossier, :returns => dossiers_proc
    #expects :date_appel, :on => dossier_proc, :returns => dossier_proc
    #expects :beginning_of_year, :on => dossier_proc, :returns => dossier_proc
    should_assign_to :dossiers, :with => dossiers_proc
    should_render_template 'index'
  end

  describe :get => :new do
    expects :new, :on => Dossier
    should_assign_to :dossier
    should_render_template 'new'
  end

  describe :post => :create, :dossier => { :these => 'params' } do
    expects :new, :on => Dossier, :with => {"these" => "params"}, :returns => dossier_proc

    context "when the dossier saves successfully" do
      expects :save, :on => dossier_proc, :returns => true
      should_assign_to :dossier, :with => dossier_proc
      should_set_the_flash :notice, :to => "The dossier was saved successfully."
      should_redirect_to { dossier_url(@dossier)}
    end

    context "when the dossier fails to save" do
      expects :save, :on => dossier_proc, :returns => false
      should_assign_to :dossier, :with => dossier_proc
      should_render_template 'new'
    end
  end
end
