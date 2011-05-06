require "spec_helper"

describe DossiersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/dossiers" }.should route_to(:controller => "dossiers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/dossiers/new" }.should route_to(:controller => "dossiers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/dossiers/1" }.should route_to(:controller => "dossiers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/dossiers/1/edit" }.should route_to(:controller => "dossiers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/dossiers" }.should route_to(:controller => "dossiers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/dossiers/1" }.should route_to(:controller => "dossiers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/dossiers/1" }.should route_to(:controller => "dossiers", :action => "destroy", :id => "1")
    end

  end
end
