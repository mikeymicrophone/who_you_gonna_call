require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CallsController do

  def mock_call(stubs={})
    @mock_call ||= mock_model(Call, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all calls as @calls" do
      Call.should_receive(:find).with(:all).and_return([mock_call])
      get :index
      assigns[:calls].should == [mock_call]
    end

    describe "with mime type of xml" do
  
      it "should render all calls as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Call.should_receive(:find).with(:all).and_return(calls = mock("Array of Calls"))
        calls.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested call as @call" do
      Call.should_receive(:find).with("37").and_return(mock_call)
      get :show, :id => "37"
      assigns[:call].should equal(mock_call)
    end
    
    describe "with mime type of xml" do

      it "should render the requested call as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Call.should_receive(:find).with("37").and_return(mock_call)
        mock_call.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new call as @call" do
      Call.should_receive(:new).and_return(mock_call)
      get :new
      assigns[:call].should equal(mock_call)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested call as @call" do
      Call.should_receive(:find).with("37").and_return(mock_call)
      get :edit, :id => "37"
      assigns[:call].should equal(mock_call)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created call as @call" do
        Call.should_receive(:new).with({'these' => 'params'}).and_return(mock_call(:save => true))
        post :create, :call => {:these => 'params'}
        assigns(:call).should equal(mock_call)
      end

      it "should redirect to the created call" do
        Call.stub!(:new).and_return(mock_call(:save => true))
        post :create, :call => {}
        response.should redirect_to(call_url(mock_call))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved call as @call" do
        Call.stub!(:new).with({'these' => 'params'}).and_return(mock_call(:save => false))
        post :create, :call => {:these => 'params'}
        assigns(:call).should equal(mock_call)
      end

      it "should re-render the 'new' template" do
        Call.stub!(:new).and_return(mock_call(:save => false))
        post :create, :call => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested call" do
        Call.should_receive(:find).with("37").and_return(mock_call)
        mock_call.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :call => {:these => 'params'}
      end

      it "should expose the requested call as @call" do
        Call.stub!(:find).and_return(mock_call(:update_attributes => true))
        put :update, :id => "1"
        assigns(:call).should equal(mock_call)
      end

      it "should redirect to the call" do
        Call.stub!(:find).and_return(mock_call(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(call_url(mock_call))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested call" do
        Call.should_receive(:find).with("37").and_return(mock_call)
        mock_call.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :call => {:these => 'params'}
      end

      it "should expose the call as @call" do
        Call.stub!(:find).and_return(mock_call(:update_attributes => false))
        put :update, :id => "1"
        assigns(:call).should equal(mock_call)
      end

      it "should re-render the 'edit' template" do
        Call.stub!(:find).and_return(mock_call(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested call" do
      Call.should_receive(:find).with("37").and_return(mock_call)
      mock_call.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the calls list" do
      Call.stub!(:find).and_return(mock_call(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(calls_url)
    end

  end

end
