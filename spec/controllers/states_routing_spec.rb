require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StatesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "states", :action => "index").should == "/states"
    end
  
    it "should map #new" do
      route_for(:controller => "states", :action => "new").should == "/states/new"
    end
  
    it "should map #show" do
      route_for(:controller => "states", :action => "show", :id => 1).should == "/states/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "states", :action => "edit", :id => 1).should == "/states/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "states", :action => "update", :id => 1).should == "/states/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "states", :action => "destroy", :id => 1).should == "/states/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/states").should == {:controller => "states", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/states/new").should == {:controller => "states", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/states").should == {:controller => "states", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/states/1").should == {:controller => "states", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/states/1/edit").should == {:controller => "states", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/states/1").should == {:controller => "states", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/states/1").should == {:controller => "states", :action => "destroy", :id => "1"}
    end
  end
end
