require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RendezvouzsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "rendezvouzs", :action => "index").should == "/rendezvouzs"
    end
  
    it "should map #new" do
      route_for(:controller => "rendezvouzs", :action => "new").should == "/rendezvouzs/new"
    end
  
    it "should map #show" do
      route_for(:controller => "rendezvouzs", :action => "show", :id => 1).should == "/rendezvouzs/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "rendezvouzs", :action => "edit", :id => 1).should == "/rendezvouzs/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "rendezvouzs", :action => "update", :id => 1).should == "/rendezvouzs/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "rendezvouzs", :action => "destroy", :id => 1).should == "/rendezvouzs/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/rendezvouzs").should == {:controller => "rendezvouzs", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/rendezvouzs/new").should == {:controller => "rendezvouzs", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/rendezvouzs").should == {:controller => "rendezvouzs", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/rendezvouzs/1").should == {:controller => "rendezvouzs", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/rendezvouzs/1/edit").should == {:controller => "rendezvouzs", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/rendezvouzs/1").should == {:controller => "rendezvouzs", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/rendezvouzs/1").should == {:controller => "rendezvouzs", :action => "destroy", :id => "1"}
    end
  end
end
