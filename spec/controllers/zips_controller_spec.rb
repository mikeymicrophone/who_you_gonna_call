require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ZipsController do

  def mock_zip(stubs={})
    @mock_zip ||= mock_model(Zip, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all zips as @zips" do
      Zip.should_receive(:find).with(:all).and_return([mock_zip])
      get :index
      assigns[:zips].should == [mock_zip]
    end

    describe "with mime type of xml" do
  
      it "should render all zips as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Zip.should_receive(:find).with(:all).and_return(zips = mock("Array of Zips"))
        zips.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested zip as @zip" do
      Zip.should_receive(:find).with("37").and_return(mock_zip)
      get :show, :id => "37"
      assigns[:zip].should equal(mock_zip)
    end
    
    describe "with mime type of xml" do

      it "should render the requested zip as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Zip.should_receive(:find).with("37").and_return(mock_zip)
        mock_zip.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new zip as @zip" do
      Zip.should_receive(:new).and_return(mock_zip)
      get :new
      assigns[:zip].should equal(mock_zip)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested zip as @zip" do
      Zip.should_receive(:find).with("37").and_return(mock_zip)
      get :edit, :id => "37"
      assigns[:zip].should equal(mock_zip)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created zip as @zip" do
        Zip.should_receive(:new).with({'these' => 'params'}).and_return(mock_zip(:save => true))
        post :create, :zip => {:these => 'params'}
        assigns(:zip).should equal(mock_zip)
      end

      it "should redirect to the created zip" do
        Zip.stub!(:new).and_return(mock_zip(:save => true))
        post :create, :zip => {}
        response.should redirect_to(zip_url(mock_zip))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved zip as @zip" do
        Zip.stub!(:new).with({'these' => 'params'}).and_return(mock_zip(:save => false))
        post :create, :zip => {:these => 'params'}
        assigns(:zip).should equal(mock_zip)
      end

      it "should re-render the 'new' template" do
        Zip.stub!(:new).and_return(mock_zip(:save => false))
        post :create, :zip => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested zip" do
        Zip.should_receive(:find).with("37").and_return(mock_zip)
        mock_zip.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :zip => {:these => 'params'}
      end

      it "should expose the requested zip as @zip" do
        Zip.stub!(:find).and_return(mock_zip(:update_attributes => true))
        put :update, :id => "1"
        assigns(:zip).should equal(mock_zip)
      end

      it "should redirect to the zip" do
        Zip.stub!(:find).and_return(mock_zip(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(zip_url(mock_zip))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested zip" do
        Zip.should_receive(:find).with("37").and_return(mock_zip)
        mock_zip.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :zip => {:these => 'params'}
      end

      it "should expose the zip as @zip" do
        Zip.stub!(:find).and_return(mock_zip(:update_attributes => false))
        put :update, :id => "1"
        assigns(:zip).should equal(mock_zip)
      end

      it "should re-render the 'edit' template" do
        Zip.stub!(:find).and_return(mock_zip(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested zip" do
      Zip.should_receive(:find).with("37").and_return(mock_zip)
      mock_zip.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the zips list" do
      Zip.stub!(:find).and_return(mock_zip(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(zips_url)
    end

  end

end
