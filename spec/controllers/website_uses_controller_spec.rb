require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsiteUsesController do

  def mock_website_use(stubs={})
    @mock_website_use ||= mock_model(WebsiteUse, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all website_uses as @website_uses" do
      WebsiteUse.should_receive(:find).with(:all).and_return([mock_website_use])
      get :index
      assigns[:website_uses].should == [mock_website_use]
    end

    describe "with mime type of xml" do
  
      it "should render all website_uses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        WebsiteUse.should_receive(:find).with(:all).and_return(website_uses = mock("Array of WebsiteUses"))
        website_uses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested website_use as @website_use" do
      WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
      get :show, :id => "37"
      assigns[:website_use].should equal(mock_website_use)
    end
    
    describe "with mime type of xml" do

      it "should render the requested website_use as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
        mock_website_use.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new website_use as @website_use" do
      WebsiteUse.should_receive(:new).and_return(mock_website_use)
      get :new
      assigns[:website_use].should equal(mock_website_use)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested website_use as @website_use" do
      WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
      get :edit, :id => "37"
      assigns[:website_use].should equal(mock_website_use)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created website_use as @website_use" do
        WebsiteUse.should_receive(:new).with({'these' => 'params'}).and_return(mock_website_use(:save => true))
        post :create, :website_use => {:these => 'params'}
        assigns(:website_use).should equal(mock_website_use)
      end

      it "should redirect to the created website_use" do
        WebsiteUse.stub!(:new).and_return(mock_website_use(:save => true))
        post :create, :website_use => {}
        response.should redirect_to(website_use_url(mock_website_use))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved website_use as @website_use" do
        WebsiteUse.stub!(:new).with({'these' => 'params'}).and_return(mock_website_use(:save => false))
        post :create, :website_use => {:these => 'params'}
        assigns(:website_use).should equal(mock_website_use)
      end

      it "should re-render the 'new' template" do
        WebsiteUse.stub!(:new).and_return(mock_website_use(:save => false))
        post :create, :website_use => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested website_use" do
        WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
        mock_website_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :website_use => {:these => 'params'}
      end

      it "should expose the requested website_use as @website_use" do
        WebsiteUse.stub!(:find).and_return(mock_website_use(:update_attributes => true))
        put :update, :id => "1"
        assigns(:website_use).should equal(mock_website_use)
      end

      it "should redirect to the website_use" do
        WebsiteUse.stub!(:find).and_return(mock_website_use(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(website_use_url(mock_website_use))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested website_use" do
        WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
        mock_website_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :website_use => {:these => 'params'}
      end

      it "should expose the website_use as @website_use" do
        WebsiteUse.stub!(:find).and_return(mock_website_use(:update_attributes => false))
        put :update, :id => "1"
        assigns(:website_use).should equal(mock_website_use)
      end

      it "should re-render the 'edit' template" do
        WebsiteUse.stub!(:find).and_return(mock_website_use(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested website_use" do
      WebsiteUse.should_receive(:find).with("37").and_return(mock_website_use)
      mock_website_use.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the website_uses list" do
      WebsiteUse.stub!(:find).and_return(mock_website_use(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(website_uses_url)
    end

  end

end
