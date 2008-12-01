require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe WebsitesController do

  def mock_website(stubs={})
    @mock_website ||= mock_model(Website, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all websites as @websites" do
      Website.should_receive(:find).with(:all).and_return([mock_website])
      get :index
      assigns[:websites].should == [mock_website]
    end

    describe "with mime type of xml" do
  
      it "should render all websites as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Website.should_receive(:find).with(:all).and_return(websites = mock("Array of Websites"))
        websites.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested website as @website" do
      Website.should_receive(:find).with("37").and_return(mock_website)
      get :show, :id => "37"
      assigns[:website].should equal(mock_website)
    end
    
    describe "with mime type of xml" do

      it "should render the requested website as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Website.should_receive(:find).with("37").and_return(mock_website)
        mock_website.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new website as @website" do
      Website.should_receive(:new).and_return(mock_website)
      get :new
      assigns[:website].should equal(mock_website)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested website as @website" do
      Website.should_receive(:find).with("37").and_return(mock_website)
      get :edit, :id => "37"
      assigns[:website].should equal(mock_website)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created website as @website" do
        Website.should_receive(:new).with({'these' => 'params'}).and_return(mock_website(:save => true))
        post :create, :website => {:these => 'params'}
        assigns(:website).should equal(mock_website)
      end

      it "should redirect to the created website" do
        Website.stub!(:new).and_return(mock_website(:save => true))
        post :create, :website => {}
        response.should redirect_to(website_url(mock_website))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved website as @website" do
        Website.stub!(:new).with({'these' => 'params'}).and_return(mock_website(:save => false))
        post :create, :website => {:these => 'params'}
        assigns(:website).should equal(mock_website)
      end

      it "should re-render the 'new' template" do
        Website.stub!(:new).and_return(mock_website(:save => false))
        post :create, :website => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested website" do
        Website.should_receive(:find).with("37").and_return(mock_website)
        mock_website.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :website => {:these => 'params'}
      end

      it "should expose the requested website as @website" do
        Website.stub!(:find).and_return(mock_website(:update_attributes => true))
        put :update, :id => "1"
        assigns(:website).should equal(mock_website)
      end

      it "should redirect to the website" do
        Website.stub!(:find).and_return(mock_website(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(website_url(mock_website))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested website" do
        Website.should_receive(:find).with("37").and_return(mock_website)
        mock_website.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :website => {:these => 'params'}
      end

      it "should expose the website as @website" do
        Website.stub!(:find).and_return(mock_website(:update_attributes => false))
        put :update, :id => "1"
        assigns(:website).should equal(mock_website)
      end

      it "should re-render the 'edit' template" do
        Website.stub!(:find).and_return(mock_website(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested website" do
      Website.should_receive(:find).with("37").and_return(mock_website)
      mock_website.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the websites list" do
      Website.stub!(:find).and_return(mock_website(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(websites_url)
    end

  end

end
