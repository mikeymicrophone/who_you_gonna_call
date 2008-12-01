require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ServicesController do

  def mock_service(stubs={})
    @mock_service ||= mock_model(Service, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all services as @services" do
      Service.should_receive(:find).with(:all).and_return([mock_service])
      get :index
      assigns[:services].should == [mock_service]
    end

    describe "with mime type of xml" do
  
      it "should render all services as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Service.should_receive(:find).with(:all).and_return(services = mock("Array of Services"))
        services.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested service as @service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      get :show, :id => "37"
      assigns[:service].should equal(mock_service)
    end
    
    describe "with mime type of xml" do

      it "should render the requested service as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new service as @service" do
      Service.should_receive(:new).and_return(mock_service)
      get :new
      assigns[:service].should equal(mock_service)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested service as @service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      get :edit, :id => "37"
      assigns[:service].should equal(mock_service)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created service as @service" do
        Service.should_receive(:new).with({'these' => 'params'}).and_return(mock_service(:save => true))
        post :create, :service => {:these => 'params'}
        assigns(:service).should equal(mock_service)
      end

      it "should redirect to the created service" do
        Service.stub!(:new).and_return(mock_service(:save => true))
        post :create, :service => {}
        response.should redirect_to(service_url(mock_service))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved service as @service" do
        Service.stub!(:new).with({'these' => 'params'}).and_return(mock_service(:save => false))
        post :create, :service => {:these => 'params'}
        assigns(:service).should equal(mock_service)
      end

      it "should re-render the 'new' template" do
        Service.stub!(:new).and_return(mock_service(:save => false))
        post :create, :service => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested service" do
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :service => {:these => 'params'}
      end

      it "should expose the requested service as @service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => true))
        put :update, :id => "1"
        assigns(:service).should equal(mock_service)
      end

      it "should redirect to the service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(service_url(mock_service))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested service" do
        Service.should_receive(:find).with("37").and_return(mock_service)
        mock_service.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :service => {:these => 'params'}
      end

      it "should expose the service as @service" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => false))
        put :update, :id => "1"
        assigns(:service).should equal(mock_service)
      end

      it "should re-render the 'edit' template" do
        Service.stub!(:find).and_return(mock_service(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested service" do
      Service.should_receive(:find).with("37").and_return(mock_service)
      mock_service.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the services list" do
      Service.stub!(:find).and_return(mock_service(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(services_url)
    end

  end

end
