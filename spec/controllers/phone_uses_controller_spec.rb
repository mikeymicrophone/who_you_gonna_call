require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhoneUsesController do

  def mock_phone_use(stubs={})
    @mock_phone_use ||= mock_model(PhoneUse, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all phone_uses as @phone_uses" do
      PhoneUse.should_receive(:find).with(:all).and_return([mock_phone_use])
      get :index
      assigns[:phone_uses].should == [mock_phone_use]
    end

    describe "with mime type of xml" do
  
      it "should render all phone_uses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PhoneUse.should_receive(:find).with(:all).and_return(phone_uses = mock("Array of PhoneUses"))
        phone_uses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested phone_use as @phone_use" do
      PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
      get :show, :id => "37"
      assigns[:phone_use].should equal(mock_phone_use)
    end
    
    describe "with mime type of xml" do

      it "should render the requested phone_use as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
        mock_phone_use.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new phone_use as @phone_use" do
      PhoneUse.should_receive(:new).and_return(mock_phone_use)
      get :new
      assigns[:phone_use].should equal(mock_phone_use)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested phone_use as @phone_use" do
      PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
      get :edit, :id => "37"
      assigns[:phone_use].should equal(mock_phone_use)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created phone_use as @phone_use" do
        PhoneUse.should_receive(:new).with({'these' => 'params'}).and_return(mock_phone_use(:save => true))
        post :create, :phone_use => {:these => 'params'}
        assigns(:phone_use).should equal(mock_phone_use)
      end

      it "should redirect to the created phone_use" do
        PhoneUse.stub!(:new).and_return(mock_phone_use(:save => true))
        post :create, :phone_use => {}
        response.should redirect_to(phone_use_url(mock_phone_use))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved phone_use as @phone_use" do
        PhoneUse.stub!(:new).with({'these' => 'params'}).and_return(mock_phone_use(:save => false))
        post :create, :phone_use => {:these => 'params'}
        assigns(:phone_use).should equal(mock_phone_use)
      end

      it "should re-render the 'new' template" do
        PhoneUse.stub!(:new).and_return(mock_phone_use(:save => false))
        post :create, :phone_use => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested phone_use" do
        PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
        mock_phone_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phone_use => {:these => 'params'}
      end

      it "should expose the requested phone_use as @phone_use" do
        PhoneUse.stub!(:find).and_return(mock_phone_use(:update_attributes => true))
        put :update, :id => "1"
        assigns(:phone_use).should equal(mock_phone_use)
      end

      it "should redirect to the phone_use" do
        PhoneUse.stub!(:find).and_return(mock_phone_use(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(phone_use_url(mock_phone_use))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested phone_use" do
        PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
        mock_phone_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phone_use => {:these => 'params'}
      end

      it "should expose the phone_use as @phone_use" do
        PhoneUse.stub!(:find).and_return(mock_phone_use(:update_attributes => false))
        put :update, :id => "1"
        assigns(:phone_use).should equal(mock_phone_use)
      end

      it "should re-render the 'edit' template" do
        PhoneUse.stub!(:find).and_return(mock_phone_use(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested phone_use" do
      PhoneUse.should_receive(:find).with("37").and_return(mock_phone_use)
      mock_phone_use.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the phone_uses list" do
      PhoneUse.stub!(:find).and_return(mock_phone_use(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(phone_uses_url)
    end

  end

end
