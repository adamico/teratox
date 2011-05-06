require "spec_helper"

describe CorrespondantsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/correspondants" }.should route_to(:controller => "correspondants", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/correspondants/new" }.should route_to(:controller => "correspondants", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/correspondants/1" }.should route_to(:controller => "correspondants", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/correspondants/1/edit" }.should route_to(:controller => "correspondants", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/correspondants" }.should route_to(:controller => "correspondants", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/correspondants/1" }.should route_to(:controller => "correspondants", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/correspondants/1" }.should route_to(:controller => "correspondants", :action => "destroy", :id => "1")
    end

  end
end
