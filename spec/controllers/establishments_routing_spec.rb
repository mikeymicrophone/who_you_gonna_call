require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EstablishmentsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "establishments", :action => "index").should == "/establishments"
    end
  
    it "should map #new" do
      route_for(:controller => "establishments", :action => "new").should == "/establishments/new"
    end
  
    it "should map #show" do
      route_for(:controller => "establishments", :action => "show", :id => 1).should == "/establishments/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "establishments", :action => "edit", :id => 1).should == "/establishments/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "establishments", :action => "update", :id => 1).should == "/establishments/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "establishments", :action => "destroy", :id => 1).should == "/establishments/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/establishments").should == {:controller => "establishments", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/establishments/new").should == {:controller => "establishments", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/establishments").should == {:controller => "establishments", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/establishments/1").should == {:controller => "establishments", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/establishments/1/edit").should == {:controller => "establishments", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/establishments/1").should == {:controller => "establishments", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/establishments/1").should == {:controller => "establishments", :action => "destroy", :id => "1"}
    end
  end
end
