require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmailsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "emails", :action => "index").should == "/emails"
    end
  
    it "should map #new" do
      route_for(:controller => "emails", :action => "new").should == "/emails/new"
    end
  
    it "should map #show" do
      route_for(:controller => "emails", :action => "show", :id => 1).should == "/emails/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "emails", :action => "edit", :id => 1).should == "/emails/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "emails", :action => "update", :id => 1).should == "/emails/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "emails", :action => "destroy", :id => 1).should == "/emails/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/emails").should == {:controller => "emails", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/emails/new").should == {:controller => "emails", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/emails").should == {:controller => "emails", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/emails/1").should == {:controller => "emails", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/emails/1/edit").should == {:controller => "emails", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/emails/1").should == {:controller => "emails", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/emails/1").should == {:controller => "emails", :action => "destroy", :id => "1"}
    end
  end
end
