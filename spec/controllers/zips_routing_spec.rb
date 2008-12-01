require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ZipsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "zips", :action => "index").should == "/zips"
    end
  
    it "should map #new" do
      route_for(:controller => "zips", :action => "new").should == "/zips/new"
    end
  
    it "should map #show" do
      route_for(:controller => "zips", :action => "show", :id => 1).should == "/zips/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "zips", :action => "edit", :id => 1).should == "/zips/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "zips", :action => "update", :id => 1).should == "/zips/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "zips", :action => "destroy", :id => 1).should == "/zips/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/zips").should == {:controller => "zips", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/zips/new").should == {:controller => "zips", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/zips").should == {:controller => "zips", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/zips/1").should == {:controller => "zips", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/zips/1/edit").should == {:controller => "zips", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/zips/1").should == {:controller => "zips", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/zips/1").should == {:controller => "zips", :action => "destroy", :id => "1"}
    end
  end
end
