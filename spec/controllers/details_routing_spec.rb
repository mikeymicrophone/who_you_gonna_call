require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DetailsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "details", :action => "index").should == "/details"
    end
  
    it "should map #new" do
      route_for(:controller => "details", :action => "new").should == "/details/new"
    end
  
    it "should map #show" do
      route_for(:controller => "details", :action => "show", :id => 1).should == "/details/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "details", :action => "edit", :id => 1).should == "/details/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "details", :action => "update", :id => 1).should == "/details/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "details", :action => "destroy", :id => 1).should == "/details/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/details").should == {:controller => "details", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/details/new").should == {:controller => "details", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/details").should == {:controller => "details", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/details/1").should == {:controller => "details", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/details/1/edit").should == {:controller => "details", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/details/1").should == {:controller => "details", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/details/1").should == {:controller => "details", :action => "destroy", :id => "1"}
    end
  end
end
