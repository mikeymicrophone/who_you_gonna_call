require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DetailsController do

  def mock_detail(stubs={})
    @mock_detail ||= mock_model(Detail, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all details as @details" do
      Detail.should_receive(:find).with(:all).and_return([mock_detail])
      get :index
      assigns[:details].should == [mock_detail]
    end

    describe "with mime type of xml" do
  
      it "should render all details as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Detail.should_receive(:find).with(:all).and_return(details = mock("Array of Details"))
        details.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested detail as @detail" do
      Detail.should_receive(:find).with("37").and_return(mock_detail)
      get :show, :id => "37"
      assigns[:detail].should equal(mock_detail)
    end
    
    describe "with mime type of xml" do

      it "should render the requested detail as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Detail.should_receive(:find).with("37").and_return(mock_detail)
        mock_detail.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new detail as @detail" do
      Detail.should_receive(:new).and_return(mock_detail)
      get :new
      assigns[:detail].should equal(mock_detail)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested detail as @detail" do
      Detail.should_receive(:find).with("37").and_return(mock_detail)
      get :edit, :id => "37"
      assigns[:detail].should equal(mock_detail)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created detail as @detail" do
        Detail.should_receive(:new).with({'these' => 'params'}).and_return(mock_detail(:save => true))
        post :create, :detail => {:these => 'params'}
        assigns(:detail).should equal(mock_detail)
      end

      it "should redirect to the created detail" do
        Detail.stub!(:new).and_return(mock_detail(:save => true))
        post :create, :detail => {}
        response.should redirect_to(detail_url(mock_detail))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved detail as @detail" do
        Detail.stub!(:new).with({'these' => 'params'}).and_return(mock_detail(:save => false))
        post :create, :detail => {:these => 'params'}
        assigns(:detail).should equal(mock_detail)
      end

      it "should re-render the 'new' template" do
        Detail.stub!(:new).and_return(mock_detail(:save => false))
        post :create, :detail => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested detail" do
        Detail.should_receive(:find).with("37").and_return(mock_detail)
        mock_detail.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :detail => {:these => 'params'}
      end

      it "should expose the requested detail as @detail" do
        Detail.stub!(:find).and_return(mock_detail(:update_attributes => true))
        put :update, :id => "1"
        assigns(:detail).should equal(mock_detail)
      end

      it "should redirect to the detail" do
        Detail.stub!(:find).and_return(mock_detail(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(detail_url(mock_detail))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested detail" do
        Detail.should_receive(:find).with("37").and_return(mock_detail)
        mock_detail.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :detail => {:these => 'params'}
      end

      it "should expose the detail as @detail" do
        Detail.stub!(:find).and_return(mock_detail(:update_attributes => false))
        put :update, :id => "1"
        assigns(:detail).should equal(mock_detail)
      end

      it "should re-render the 'edit' template" do
        Detail.stub!(:find).and_return(mock_detail(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested detail" do
      Detail.should_receive(:find).with("37").and_return(mock_detail)
      mock_detail.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the details list" do
      Detail.stub!(:find).and_return(mock_detail(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(details_url)
    end

  end

end
