require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StreetsController do

  def mock_street(stubs={})
    @mock_street ||= mock_model(Street, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all streets as @streets" do
      Street.should_receive(:find).with(:all).and_return([mock_street])
      get :index
      assigns[:streets].should == [mock_street]
    end

    describe "with mime type of xml" do
  
      it "should render all streets as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Street.should_receive(:find).with(:all).and_return(streets = mock("Array of Streets"))
        streets.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested street as @street" do
      Street.should_receive(:find).with("37").and_return(mock_street)
      get :show, :id => "37"
      assigns[:street].should equal(mock_street)
    end
    
    describe "with mime type of xml" do

      it "should render the requested street as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Street.should_receive(:find).with("37").and_return(mock_street)
        mock_street.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new street as @street" do
      Street.should_receive(:new).and_return(mock_street)
      get :new
      assigns[:street].should equal(mock_street)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested street as @street" do
      Street.should_receive(:find).with("37").and_return(mock_street)
      get :edit, :id => "37"
      assigns[:street].should equal(mock_street)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created street as @street" do
        Street.should_receive(:new).with({'these' => 'params'}).and_return(mock_street(:save => true))
        post :create, :street => {:these => 'params'}
        assigns(:street).should equal(mock_street)
      end

      it "should redirect to the created street" do
        Street.stub!(:new).and_return(mock_street(:save => true))
        post :create, :street => {}
        response.should redirect_to(street_url(mock_street))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved street as @street" do
        Street.stub!(:new).with({'these' => 'params'}).and_return(mock_street(:save => false))
        post :create, :street => {:these => 'params'}
        assigns(:street).should equal(mock_street)
      end

      it "should re-render the 'new' template" do
        Street.stub!(:new).and_return(mock_street(:save => false))
        post :create, :street => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested street" do
        Street.should_receive(:find).with("37").and_return(mock_street)
        mock_street.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :street => {:these => 'params'}
      end

      it "should expose the requested street as @street" do
        Street.stub!(:find).and_return(mock_street(:update_attributes => true))
        put :update, :id => "1"
        assigns(:street).should equal(mock_street)
      end

      it "should redirect to the street" do
        Street.stub!(:find).and_return(mock_street(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(street_url(mock_street))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested street" do
        Street.should_receive(:find).with("37").and_return(mock_street)
        mock_street.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :street => {:these => 'params'}
      end

      it "should expose the street as @street" do
        Street.stub!(:find).and_return(mock_street(:update_attributes => false))
        put :update, :id => "1"
        assigns(:street).should equal(mock_street)
      end

      it "should re-render the 'edit' template" do
        Street.stub!(:find).and_return(mock_street(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested street" do
      Street.should_receive(:find).with("37").and_return(mock_street)
      mock_street.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the streets list" do
      Street.stub!(:find).and_return(mock_street(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(streets_url)
    end

  end

end
