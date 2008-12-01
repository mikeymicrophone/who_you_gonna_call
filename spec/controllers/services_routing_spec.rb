require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServicesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "services", :action => "index").should == "/services"
    end
  
    it "should map #new" do
      route_for(:controller => "services", :action => "new").should == "/services/new"
    end
  
    it "should map #show" do
      route_for(:controller => "services", :action => "show", :id => 1).should == "/services/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "services", :action => "edit", :id => 1).should == "/services/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "services", :action => "update", :id => 1).should == "/services/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "services", :action => "destroy", :id => 1).should == "/services/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/services").should == {:controller => "services", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/services/new").should == {:controller => "services", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/services").should == {:controller => "services", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/services/1").should == {:controller => "services", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/services/1/edit").should == {:controller => "services", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/services/1").should == {:controller => "services", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/services/1").should == {:controller => "services", :action => "destroy", :id => "1"}
    end
  end
end
