require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AddressUsesController do

  def mock_address_use(stubs={})
    @mock_address_use ||= mock_model(AddressUse, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all address_uses as @address_uses" do
      AddressUse.should_receive(:find).with(:all).and_return([mock_address_use])
      get :index
      assigns[:address_uses].should == [mock_address_use]
    end

    describe "with mime type of xml" do
  
      it "should render all address_uses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        AddressUse.should_receive(:find).with(:all).and_return(address_uses = mock("Array of AddressUses"))
        address_uses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested address_use as @address_use" do
      AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
      get :show, :id => "37"
      assigns[:address_use].should equal(mock_address_use)
    end
    
    describe "with mime type of xml" do

      it "should render the requested address_use as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
        mock_address_use.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new address_use as @address_use" do
      AddressUse.should_receive(:new).and_return(mock_address_use)
      get :new
      assigns[:address_use].should equal(mock_address_use)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested address_use as @address_use" do
      AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
      get :edit, :id => "37"
      assigns[:address_use].should equal(mock_address_use)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created address_use as @address_use" do
        AddressUse.should_receive(:new).with({'these' => 'params'}).and_return(mock_address_use(:save => true))
        post :create, :address_use => {:these => 'params'}
        assigns(:address_use).should equal(mock_address_use)
      end

      it "should redirect to the created address_use" do
        AddressUse.stub!(:new).and_return(mock_address_use(:save => true))
        post :create, :address_use => {}
        response.should redirect_to(address_use_url(mock_address_use))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved address_use as @address_use" do
        AddressUse.stub!(:new).with({'these' => 'params'}).and_return(mock_address_use(:save => false))
        post :create, :address_use => {:these => 'params'}
        assigns(:address_use).should equal(mock_address_use)
      end

      it "should re-render the 'new' template" do
        AddressUse.stub!(:new).and_return(mock_address_use(:save => false))
        post :create, :address_use => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested address_use" do
        AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
        mock_address_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address_use => {:these => 'params'}
      end

      it "should expose the requested address_use as @address_use" do
        AddressUse.stub!(:find).and_return(mock_address_use(:update_attributes => true))
        put :update, :id => "1"
        assigns(:address_use).should equal(mock_address_use)
      end

      it "should redirect to the address_use" do
        AddressUse.stub!(:find).and_return(mock_address_use(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(address_use_url(mock_address_use))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested address_use" do
        AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
        mock_address_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address_use => {:these => 'params'}
      end

      it "should expose the address_use as @address_use" do
        AddressUse.stub!(:find).and_return(mock_address_use(:update_attributes => false))
        put :update, :id => "1"
        assigns(:address_use).should equal(mock_address_use)
      end

      it "should re-render the 'edit' template" do
        AddressUse.stub!(:find).and_return(mock_address_use(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested address_use" do
      AddressUse.should_receive(:find).with("37").and_return(mock_address_use)
      mock_address_use.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the address_uses list" do
      AddressUse.stub!(:find).and_return(mock_address_use(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(address_uses_url)
    end

  end

end
