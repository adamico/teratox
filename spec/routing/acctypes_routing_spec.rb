require "spec_helper"

describe AcctypesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/acctypes" }.should route_to(:controller => "acctypes", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/acctypes/new" }.should route_to(:controller => "acctypes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/acctypes/1" }.should route_to(:controller => "acctypes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/acctypes/1/edit" }.should route_to(:controller => "acctypes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/acctypes" }.should route_to(:controller => "acctypes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/acctypes/1" }.should route_to(:controller => "acctypes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/acctypes/1" }.should route_to(:controller => "acctypes", :action => "destroy", :id => "1")
    end

  end
end
