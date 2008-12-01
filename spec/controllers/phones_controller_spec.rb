require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PhonesController do

  def mock_phone(stubs={})
    @mock_phone ||= mock_model(Phone, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all phones as @phones" do
      Phone.should_receive(:find).with(:all).and_return([mock_phone])
      get :index
      assigns[:phones].should == [mock_phone]
    end

    describe "with mime type of xml" do
  
      it "should render all phones as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Phone.should_receive(:find).with(:all).and_return(phones = mock("Array of Phones"))
        phones.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested phone as @phone" do
      Phone.should_receive(:find).with("37").and_return(mock_phone)
      get :show, :id => "37"
      assigns[:phone].should equal(mock_phone)
    end
    
    describe "with mime type of xml" do

      it "should render the requested phone as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Phone.should_receive(:find).with("37").and_return(mock_phone)
        mock_phone.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new phone as @phone" do
      Phone.should_receive(:new).and_return(mock_phone)
      get :new
      assigns[:phone].should equal(mock_phone)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested phone as @phone" do
      Phone.should_receive(:find).with("37").and_return(mock_phone)
      get :edit, :id => "37"
      assigns[:phone].should equal(mock_phone)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created phone as @phone" do
        Phone.should_receive(:new).with({'these' => 'params'}).and_return(mock_phone(:save => true))
        post :create, :phone => {:these => 'params'}
        assigns(:phone).should equal(mock_phone)
      end

      it "should redirect to the created phone" do
        Phone.stub!(:new).and_return(mock_phone(:save => true))
        post :create, :phone => {}
        response.should redirect_to(phone_url(mock_phone))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved phone as @phone" do
        Phone.stub!(:new).with({'these' => 'params'}).and_return(mock_phone(:save => false))
        post :create, :phone => {:these => 'params'}
        assigns(:phone).should equal(mock_phone)
      end

      it "should re-render the 'new' template" do
        Phone.stub!(:new).and_return(mock_phone(:save => false))
        post :create, :phone => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested phone" do
        Phone.should_receive(:find).with("37").and_return(mock_phone)
        mock_phone.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phone => {:these => 'params'}
      end

      it "should expose the requested phone as @phone" do
        Phone.stub!(:find).and_return(mock_phone(:update_attributes => true))
        put :update, :id => "1"
        assigns(:phone).should equal(mock_phone)
      end

      it "should redirect to the phone" do
        Phone.stub!(:find).and_return(mock_phone(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(phone_url(mock_phone))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested phone" do
        Phone.should_receive(:find).with("37").and_return(mock_phone)
        mock_phone.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :phone => {:these => 'params'}
      end

      it "should expose the phone as @phone" do
        Phone.stub!(:find).and_return(mock_phone(:update_attributes => false))
        put :update, :id => "1"
        assigns(:phone).should equal(mock_phone)
      end

      it "should re-render the 'edit' template" do
        Phone.stub!(:find).and_return(mock_phone(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested phone" do
      Phone.should_receive(:find).with("37").and_return(mock_phone)
      mock_phone.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the phones list" do
      Phone.stub!(:find).and_return(mock_phone(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(phones_url)
    end

  end

end
