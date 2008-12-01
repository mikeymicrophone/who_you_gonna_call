require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TxtsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "txts", :action => "index").should == "/txts"
    end
  
    it "should map #new" do
      route_for(:controller => "txts", :action => "new").should == "/txts/new"
    end
  
    it "should map #show" do
      route_for(:controller => "txts", :action => "show", :id => 1).should == "/txts/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "txts", :action => "edit", :id => 1).should == "/txts/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "txts", :action => "update", :id => 1).should == "/txts/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "txts", :action => "destroy", :id => 1).should == "/txts/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/txts").should == {:controller => "txts", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/txts/new").should == {:controller => "txts", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/txts").should == {:controller => "txts", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/txts/1").should == {:controller => "txts", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/txts/1/edit").should == {:controller => "txts", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/txts/1").should == {:controller => "txts", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/txts/1").should == {:controller => "txts", :action => "destroy", :id => "1"}
    end
  end
end
