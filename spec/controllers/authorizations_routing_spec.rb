require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorizationsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "authorizations", :action => "index").should == "/authorizations"
    end
  
    it "should map #new" do
      route_for(:controller => "authorizations", :action => "new").should == "/authorizations/new"
    end
  
    it "should map #show" do
      route_for(:controller => "authorizations", :action => "show", :id => 1).should == "/authorizations/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "authorizations", :action => "edit", :id => 1).should == "/authorizations/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "authorizations", :action => "update", :id => 1).should == "/authorizations/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "authorizations", :action => "destroy", :id => 1).should == "/authorizations/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/authorizations").should == {:controller => "authorizations", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/authorizations/new").should == {:controller => "authorizations", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/authorizations").should == {:controller => "authorizations", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/authorizations/1").should == {:controller => "authorizations", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/authorizations/1/edit").should == {:controller => "authorizations", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/authorizations/1").should == {:controller => "authorizations", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/authorizations/1").should == {:controller => "authorizations", :action => "destroy", :id => "1"}
    end
  end
end
