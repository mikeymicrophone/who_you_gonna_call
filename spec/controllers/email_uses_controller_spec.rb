require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EmailUsesController do

  def mock_email_use(stubs={})
    @mock_email_use ||= mock_model(EmailUse, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all email_uses as @email_uses" do
      EmailUse.should_receive(:find).with(:all).and_return([mock_email_use])
      get :index
      assigns[:email_uses].should == [mock_email_use]
    end

    describe "with mime type of xml" do
  
      it "should render all email_uses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        EmailUse.should_receive(:find).with(:all).and_return(email_uses = mock("Array of EmailUses"))
        email_uses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested email_use as @email_use" do
      EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
      get :show, :id => "37"
      assigns[:email_use].should equal(mock_email_use)
    end
    
    describe "with mime type of xml" do

      it "should render the requested email_use as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
        mock_email_use.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new email_use as @email_use" do
      EmailUse.should_receive(:new).and_return(mock_email_use)
      get :new
      assigns[:email_use].should equal(mock_email_use)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested email_use as @email_use" do
      EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
      get :edit, :id => "37"
      assigns[:email_use].should equal(mock_email_use)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created email_use as @email_use" do
        EmailUse.should_receive(:new).with({'these' => 'params'}).and_return(mock_email_use(:save => true))
        post :create, :email_use => {:these => 'params'}
        assigns(:email_use).should equal(mock_email_use)
      end

      it "should redirect to the created email_use" do
        EmailUse.stub!(:new).and_return(mock_email_use(:save => true))
        post :create, :email_use => {}
        response.should redirect_to(email_use_url(mock_email_use))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved email_use as @email_use" do
        EmailUse.stub!(:new).with({'these' => 'params'}).and_return(mock_email_use(:save => false))
        post :create, :email_use => {:these => 'params'}
        assigns(:email_use).should equal(mock_email_use)
      end

      it "should re-render the 'new' template" do
        EmailUse.stub!(:new).and_return(mock_email_use(:save => false))
        post :create, :email_use => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested email_use" do
        EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
        mock_email_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :email_use => {:these => 'params'}
      end

      it "should expose the requested email_use as @email_use" do
        EmailUse.stub!(:find).and_return(mock_email_use(:update_attributes => true))
        put :update, :id => "1"
        assigns(:email_use).should equal(mock_email_use)
      end

      it "should redirect to the email_use" do
        EmailUse.stub!(:find).and_return(mock_email_use(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(email_use_url(mock_email_use))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested email_use" do
        EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
        mock_email_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :email_use => {:these => 'params'}
      end

      it "should expose the email_use as @email_use" do
        EmailUse.stub!(:find).and_return(mock_email_use(:update_attributes => false))
        put :update, :id => "1"
        assigns(:email_use).should equal(mock_email_use)
      end

      it "should re-render the 'edit' template" do
        EmailUse.stub!(:find).and_return(mock_email_use(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested email_use" do
      EmailUse.should_receive(:find).with("37").and_return(mock_email_use)
      mock_email_use.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the email_uses list" do
      EmailUse.stub!(:find).and_return(mock_email_use(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(email_uses_url)
    end

  end

end
