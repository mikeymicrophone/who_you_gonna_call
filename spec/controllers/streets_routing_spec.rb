require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StreetsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "streets", :action => "index").should == "/streets"
    end
  
    it "should map #new" do
      route_for(:controller => "streets", :action => "new").should == "/streets/new"
    end
  
    it "should map #show" do
      route_for(:controller => "streets", :action => "show", :id => 1).should == "/streets/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "streets", :action => "edit", :id => 1).should == "/streets/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "streets", :action => "update", :id => 1).should == "/streets/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "streets", :action => "destroy", :id => 1).should == "/streets/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/streets").should == {:controller => "streets", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/streets/new").should == {:controller => "streets", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/streets").should == {:controller => "streets", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/streets/1").should == {:controller => "streets", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/streets/1/edit").should == {:controller => "streets", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/streets/1").should == {:controller => "streets", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/streets/1").should == {:controller => "streets", :action => "destroy", :id => "1"}
    end
  end
end
