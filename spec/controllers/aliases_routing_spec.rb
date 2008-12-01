require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AliasesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "aliases", :action => "index").should == "/aliases"
    end
  
    it "should map #new" do
      route_for(:controller => "aliases", :action => "new").should == "/aliases/new"
    end
  
    it "should map #show" do
      route_for(:controller => "aliases", :action => "show", :id => 1).should == "/aliases/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "aliases", :action => "edit", :id => 1).should == "/aliases/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "aliases", :action => "update", :id => 1).should == "/aliases/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "aliases", :action => "destroy", :id => 1).should == "/aliases/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/aliases").should == {:controller => "aliases", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/aliases/new").should == {:controller => "aliases", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/aliases").should == {:controller => "aliases", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/aliases/1").should == {:controller => "aliases", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/aliases/1/edit").should == {:controller => "aliases", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/aliases/1").should == {:controller => "aliases", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/aliases/1").should == {:controller => "aliases", :action => "destroy", :id => "1"}
    end
  end
end
