require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthorizationsController do

  def mock_authorization(stubs={})
    @mock_authorization ||= mock_model(Authorization, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all authorizations as @authorizations" do
      Authorization.should_receive(:find).with(:all).and_return([mock_authorization])
      get :index
      assigns[:authorizations].should == [mock_authorization]
    end

    describe "with mime type of xml" do
  
      it "should render all authorizations as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Authorization.should_receive(:find).with(:all).and_return(authorizations = mock("Array of Authorizations"))
        authorizations.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested authorization as @authorization" do
      Authorization.should_receive(:find).with("37").and_return(mock_authorization)
      get :show, :id => "37"
      assigns[:authorization].should equal(mock_authorization)
    end
    
    describe "with mime type of xml" do

      it "should render the requested authorization as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Authorization.should_receive(:find).with("37").and_return(mock_authorization)
        mock_authorization.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new authorization as @authorization" do
      Authorization.should_receive(:new).and_return(mock_authorization)
      get :new
      assigns[:authorization].should equal(mock_authorization)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested authorization as @authorization" do
      Authorization.should_receive(:find).with("37").and_return(mock_authorization)
      get :edit, :id => "37"
      assigns[:authorization].should equal(mock_authorization)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created authorization as @authorization" do
        Authorization.should_receive(:new).with({'these' => 'params'}).and_return(mock_authorization(:save => true))
        post :create, :authorization => {:these => 'params'}
        assigns(:authorization).should equal(mock_authorization)
      end

      it "should redirect to the created authorization" do
        Authorization.stub!(:new).and_return(mock_authorization(:save => true))
        post :create, :authorization => {}
        response.should redirect_to(authorization_url(mock_authorization))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved authorization as @authorization" do
        Authorization.stub!(:new).with({'these' => 'params'}).and_return(mock_authorization(:save => false))
        post :create, :authorization => {:these => 'params'}
        assigns(:authorization).should equal(mock_authorization)
      end

      it "should re-render the 'new' template" do
        Authorization.stub!(:new).and_return(mock_authorization(:save => false))
        post :create, :authorization => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested authorization" do
        Authorization.should_receive(:find).with("37").and_return(mock_authorization)
        mock_authorization.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :authorization => {:these => 'params'}
      end

      it "should expose the requested authorization as @authorization" do
        Authorization.stub!(:find).and_return(mock_authorization(:update_attributes => true))
        put :update, :id => "1"
        assigns(:authorization).should equal(mock_authorization)
      end

      it "should redirect to the authorization" do
        Authorization.stub!(:find).and_return(mock_authorization(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(authorization_url(mock_authorization))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested authorization" do
        Authorization.should_receive(:find).with("37").and_return(mock_authorization)
        mock_authorization.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :authorization => {:these => 'params'}
      end

      it "should expose the authorization as @authorization" do
        Authorization.stub!(:find).and_return(mock_authorization(:update_attributes => false))
        put :update, :id => "1"
        assigns(:authorization).should equal(mock_authorization)
      end

      it "should re-render the 'edit' template" do
        Authorization.stub!(:find).and_return(mock_authorization(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested authorization" do
      Authorization.should_receive(:find).with("37").and_return(mock_authorization)
      mock_authorization.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the authorizations list" do
      Authorization.stub!(:find).and_return(mock_authorization(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(authorizations_url)
    end

  end

end
