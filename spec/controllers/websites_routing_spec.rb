require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsitesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "websites", :action => "index").should == "/websites"
    end
  
    it "should map #new" do
      route_for(:controller => "websites", :action => "new").should == "/websites/new"
    end
  
    it "should map #show" do
      route_for(:controller => "websites", :action => "show", :id => 1).should == "/websites/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "websites", :action => "edit", :id => 1).should == "/websites/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "websites", :action => "update", :id => 1).should == "/websites/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "websites", :action => "destroy", :id => 1).should == "/websites/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/websites").should == {:controller => "websites", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/websites/new").should == {:controller => "websites", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/websites").should == {:controller => "websites", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/websites/1").should == {:controller => "websites", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/websites/1/edit").should == {:controller => "websites", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/websites/1").should == {:controller => "websites", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/websites/1").should == {:controller => "websites", :action => "destroy", :id => "1"}
    end
  end
end
