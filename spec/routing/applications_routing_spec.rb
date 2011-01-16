require "spec_helper"

describe ApplicationsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/applications" }.should route_to(:controller => "applications", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/applications/new" }.should route_to(:controller => "applications", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/applications/1" }.should route_to(:controller => "applications", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/applications/1/edit" }.should route_to(:controller => "applications", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/applications" }.should route_to(:controller => "applications", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/applications/1" }.should route_to(:controller => "applications", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/applications/1" }.should route_to(:controller => "applications", :action => "destroy", :id => "1")
    end

  end
end
