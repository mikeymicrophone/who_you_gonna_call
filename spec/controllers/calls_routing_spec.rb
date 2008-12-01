require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CallsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "calls", :action => "index").should == "/calls"
    end
  
    it "should map #new" do
      route_for(:controller => "calls", :action => "new").should == "/calls/new"
    end
  
    it "should map #show" do
      route_for(:controller => "calls", :action => "show", :id => 1).should == "/calls/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "calls", :action => "edit", :id => 1).should == "/calls/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "calls", :action => "update", :id => 1).should == "/calls/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "calls", :action => "destroy", :id => 1).should == "/calls/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/calls").should == {:controller => "calls", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/calls/new").should == {:controller => "calls", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/calls").should == {:controller => "calls", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/calls/1").should == {:controller => "calls", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/calls/1/edit").should == {:controller => "calls", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/calls/1").should == {:controller => "calls", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/calls/1").should == {:controller => "calls", :action => "destroy", :id => "1"}
    end
  end
end
