require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PartiesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "parties", :action => "index").should == "/parties"
    end
  
    it "should map #new" do
      route_for(:controller => "parties", :action => "new").should == "/parties/new"
    end
  
    it "should map #show" do
      route_for(:controller => "parties", :action => "show", :id => 1).should == "/parties/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "parties", :action => "edit", :id => 1).should == "/parties/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "parties", :action => "update", :id => 1).should == "/parties/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "parties", :action => "destroy", :id => 1).should == "/parties/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/parties").should == {:controller => "parties", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/parties/new").should == {:controller => "parties", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/parties").should == {:controller => "parties", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/parties/1").should == {:controller => "parties", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/parties/1/edit").should == {:controller => "parties", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/parties/1").should == {:controller => "parties", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/parties/1").should == {:controller => "parties", :action => "destroy", :id => "1"}
    end
  end
end
