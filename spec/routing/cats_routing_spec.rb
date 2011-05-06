require "spec_helper"

describe CatsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/cats" }.should route_to(:controller => "cats", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/cats/new" }.should route_to(:controller => "cats", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/cats/1" }.should route_to(:controller => "cats", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/cats/1/edit" }.should route_to(:controller => "cats", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/cats" }.should route_to(:controller => "cats", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/cats/1" }.should route_to(:controller => "cats", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/cats/1" }.should route_to(:controller => "cats", :action => "destroy", :id => "1")
    end

  end
end
