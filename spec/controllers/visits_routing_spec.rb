require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VisitsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "visits", :action => "index").should == "/visits"
    end
  
    it "should map #new" do
      route_for(:controller => "visits", :action => "new").should == "/visits/new"
    end
  
    it "should map #show" do
      route_for(:controller => "visits", :action => "show", :id => 1).should == "/visits/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "visits", :action => "edit", :id => 1).should == "/visits/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "visits", :action => "update", :id => 1).should == "/visits/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "visits", :action => "destroy", :id => 1).should == "/visits/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/visits").should == {:controller => "visits", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/visits/new").should == {:controller => "visits", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/visits").should == {:controller => "visits", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/visits/1").should == {:controller => "visits", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/visits/1/edit").should == {:controller => "visits", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/visits/1").should == {:controller => "visits", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/visits/1").should == {:controller => "visits", :action => "destroy", :id => "1"}
    end
  end
end
