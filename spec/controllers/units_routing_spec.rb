require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UnitsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "units", :action => "index").should == "/units"
    end
  
    it "should map #new" do
      route_for(:controller => "units", :action => "new").should == "/units/new"
    end
  
    it "should map #show" do
      route_for(:controller => "units", :action => "show", :id => 1).should == "/units/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "units", :action => "edit", :id => 1).should == "/units/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "units", :action => "update", :id => 1).should == "/units/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "units", :action => "destroy", :id => 1).should == "/units/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/units").should == {:controller => "units", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/units/new").should == {:controller => "units", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/units").should == {:controller => "units", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/units/1").should == {:controller => "units", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/units/1/edit").should == {:controller => "units", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/units/1").should == {:controller => "units", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/units/1").should == {:controller => "units", :action => "destroy", :id => "1"}
    end
  end
end
