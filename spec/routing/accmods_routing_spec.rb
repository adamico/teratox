require "spec_helper"

describe AccmodsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/accmods" }.should route_to(:controller => "accmods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/accmods/new" }.should route_to(:controller => "accmods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/accmods/1" }.should route_to(:controller => "accmods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/accmods/1/edit" }.should route_to(:controller => "accmods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/accmods" }.should route_to(:controller => "accmods", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/accmods/1" }.should route_to(:controller => "accmods", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/accmods/1" }.should route_to(:controller => "accmods", :action => "destroy", :id => "1")
    end

  end
end
