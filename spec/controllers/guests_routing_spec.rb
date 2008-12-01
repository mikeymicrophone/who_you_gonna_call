require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuestsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "guests", :action => "index").should == "/guests"
    end
  
    it "should map #new" do
      route_for(:controller => "guests", :action => "new").should == "/guests/new"
    end
  
    it "should map #show" do
      route_for(:controller => "guests", :action => "show", :id => 1).should == "/guests/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "guests", :action => "edit", :id => 1).should == "/guests/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "guests", :action => "update", :id => 1).should == "/guests/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "guests", :action => "destroy", :id => 1).should == "/guests/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/guests").should == {:controller => "guests", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/guests/new").should == {:controller => "guests", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/guests").should == {:controller => "guests", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/guests/1").should == {:controller => "guests", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/guests/1/edit").should == {:controller => "guests", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/guests/1").should == {:controller => "guests", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/guests/1").should == {:controller => "guests", :action => "destroy", :id => "1"}
    end
  end
end
