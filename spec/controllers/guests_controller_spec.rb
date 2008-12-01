require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GuestsController do

  def mock_guest(stubs={})
    @mock_guest ||= mock_model(Guest, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all guests as @guests" do
      Guest.should_receive(:find).with(:all).and_return([mock_guest])
      get :index
      assigns[:guests].should == [mock_guest]
    end

    describe "with mime type of xml" do
  
      it "should render all guests as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Guest.should_receive(:find).with(:all).and_return(guests = mock("Array of Guests"))
        guests.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested guest as @guest" do
      Guest.should_receive(:find).with("37").and_return(mock_guest)
      get :show, :id => "37"
      assigns[:guest].should equal(mock_guest)
    end
    
    describe "with mime type of xml" do

      it "should render the requested guest as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Guest.should_receive(:find).with("37").and_return(mock_guest)
        mock_guest.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new guest as @guest" do
      Guest.should_receive(:new).and_return(mock_guest)
      get :new
      assigns[:guest].should equal(mock_guest)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested guest as @guest" do
      Guest.should_receive(:find).with("37").and_return(mock_guest)
      get :edit, :id => "37"
      assigns[:guest].should equal(mock_guest)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created guest as @guest" do
        Guest.should_receive(:new).with({'these' => 'params'}).and_return(mock_guest(:save => true))
        post :create, :guest => {:these => 'params'}
        assigns(:guest).should equal(mock_guest)
      end

      it "should redirect to the created guest" do
        Guest.stub!(:new).and_return(mock_guest(:save => true))
        post :create, :guest => {}
        response.should redirect_to(guest_url(mock_guest))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved guest as @guest" do
        Guest.stub!(:new).with({'these' => 'params'}).and_return(mock_guest(:save => false))
        post :create, :guest => {:these => 'params'}
        assigns(:guest).should equal(mock_guest)
      end

      it "should re-render the 'new' template" do
        Guest.stub!(:new).and_return(mock_guest(:save => false))
        post :create, :guest => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested guest" do
        Guest.should_receive(:find).with("37").and_return(mock_guest)
        mock_guest.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :guest => {:these => 'params'}
      end

      it "should expose the requested guest as @guest" do
        Guest.stub!(:find).and_return(mock_guest(:update_attributes => true))
        put :update, :id => "1"
        assigns(:guest).should equal(mock_guest)
      end

      it "should redirect to the guest" do
        Guest.stub!(:find).and_return(mock_guest(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(guest_url(mock_guest))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested guest" do
        Guest.should_receive(:find).with("37").and_return(mock_guest)
        mock_guest.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :guest => {:these => 'params'}
      end

      it "should expose the guest as @guest" do
        Guest.stub!(:find).and_return(mock_guest(:update_attributes => false))
        put :update, :id => "1"
        assigns(:guest).should equal(mock_guest)
      end

      it "should re-render the 'edit' template" do
        Guest.stub!(:find).and_return(mock_guest(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested guest" do
      Guest.should_receive(:find).with("37").and_return(mock_guest)
      mock_guest.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the guests list" do
      Guest.stub!(:find).and_return(mock_guest(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(guests_url)
    end

  end

end
