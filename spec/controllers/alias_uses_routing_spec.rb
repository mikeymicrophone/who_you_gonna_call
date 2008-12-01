require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AliasUsesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "alias_uses", :action => "index").should == "/alias_uses"
    end
  
    it "should map #new" do
      route_for(:controller => "alias_uses", :action => "new").should == "/alias_uses/new"
    end
  
    it "should map #show" do
      route_for(:controller => "alias_uses", :action => "show", :id => 1).should == "/alias_uses/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "alias_uses", :action => "edit", :id => 1).should == "/alias_uses/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "alias_uses", :action => "update", :id => 1).should == "/alias_uses/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "alias_uses", :action => "destroy", :id => 1).should == "/alias_uses/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/alias_uses").should == {:controller => "alias_uses", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/alias_uses/new").should == {:controller => "alias_uses", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/alias_uses").should == {:controller => "alias_uses", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/alias_uses/1").should == {:controller => "alias_uses", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/alias_uses/1/edit").should == {:controller => "alias_uses", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/alias_uses/1").should == {:controller => "alias_uses", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/alias_uses/1").should == {:controller => "alias_uses", :action => "destroy", :id => "1"}
    end
  end
end
