require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProduitsController do
  mock_models :produit

  describe :get => :index do
    should_render_template 'index'
  end

  describe :get => :show, :id => '1' do
    expects :find, :on => Produit, :with => '1', :returns => produit_proc
    should_assign_to :produit, :with => produit_proc
    should_render_template 'show'
  end

  describe :get => :new do
    expects :new, :on => Produit
    should_assign_to :produit
    should_render_template 'new'
  end

  describe :get => :edit, :id => '1' do
    expects :find, :on => Produit, :with => '1', :returns => produit_proc
    should_assign_to :produit, :with => produit_proc
    should_render_template 'edit'
  end

  describe :post => :create, :produit => { :these => 'params' } do
    expects :new, :on => Produit, :with => {"these" => "params"}, :returns => produit_proc

    context "when the produit saves successfully" do
      expects :save, :on => produit_proc, :returns => true
      should_assign_to :produit, :with => produit_proc
      should_set_the_flash :notice, :to => "The produit was saved successfully."
      should_redirect_to { produit_url(@produit)}
    end

    context "when the produit fails to save" do
      expects :save, :on => produit_proc, :returns => false
      should_assign_to :produit, :with => produit_proc
      should_render_template 'new'
    end
  end

  describe :put => :update, :id => '1', :produit => { :these => 'params'} do
    expects :find, :on => Produit, :with => '1', :returns => produit_proc
    
    context "when the produit saves successfully" do
      expects :update_attributes, :on => mock_produit, :with => { 'these' => 'params'}, :returns => produit_proc
      should_assign_to :produit, :with => produit_proc
      should_set_the_flash :notice, :to => "Produit was successfully updated."
      should_redirect_to { produit_url(@produit)}
    end

    context "when the produit fails to save" do
      expects :update_attributes, :on => mock_produit, :returns => false
      should_assign_to :produit, :with => produit_proc
      should_render_template 'edit'
    end
  end
end
