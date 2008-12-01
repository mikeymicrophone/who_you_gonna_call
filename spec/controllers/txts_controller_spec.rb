require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TxtsController do

  def mock_txt(stubs={})
    @mock_txt ||= mock_model(Txt, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all txts as @txts" do
      Txt.should_receive(:find).with(:all).and_return([mock_txt])
      get :index
      assigns[:txts].should == [mock_txt]
    end

    describe "with mime type of xml" do
  
      it "should render all txts as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Txt.should_receive(:find).with(:all).and_return(txts = mock("Array of Txts"))
        txts.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested txt as @txt" do
      Txt.should_receive(:find).with("37").and_return(mock_txt)
      get :show, :id => "37"
      assigns[:txt].should equal(mock_txt)
    end
    
    describe "with mime type of xml" do

      it "should render the requested txt as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Txt.should_receive(:find).with("37").and_return(mock_txt)
        mock_txt.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new txt as @txt" do
      Txt.should_receive(:new).and_return(mock_txt)
      get :new
      assigns[:txt].should equal(mock_txt)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested txt as @txt" do
      Txt.should_receive(:find).with("37").and_return(mock_txt)
      get :edit, :id => "37"
      assigns[:txt].should equal(mock_txt)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created txt as @txt" do
        Txt.should_receive(:new).with({'these' => 'params'}).and_return(mock_txt(:save => true))
        post :create, :txt => {:these => 'params'}
        assigns(:txt).should equal(mock_txt)
      end

      it "should redirect to the created txt" do
        Txt.stub!(:new).and_return(mock_txt(:save => true))
        post :create, :txt => {}
        response.should redirect_to(txt_url(mock_txt))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved txt as @txt" do
        Txt.stub!(:new).with({'these' => 'params'}).and_return(mock_txt(:save => false))
        post :create, :txt => {:these => 'params'}
        assigns(:txt).should equal(mock_txt)
      end

      it "should re-render the 'new' template" do
        Txt.stub!(:new).and_return(mock_txt(:save => false))
        post :create, :txt => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested txt" do
        Txt.should_receive(:find).with("37").and_return(mock_txt)
        mock_txt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :txt => {:these => 'params'}
      end

      it "should expose the requested txt as @txt" do
        Txt.stub!(:find).and_return(mock_txt(:update_attributes => true))
        put :update, :id => "1"
        assigns(:txt).should equal(mock_txt)
      end

      it "should redirect to the txt" do
        Txt.stub!(:find).and_return(mock_txt(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(txt_url(mock_txt))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested txt" do
        Txt.should_receive(:find).with("37").and_return(mock_txt)
        mock_txt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :txt => {:these => 'params'}
      end

      it "should expose the txt as @txt" do
        Txt.stub!(:find).and_return(mock_txt(:update_attributes => false))
        put :update, :id => "1"
        assigns(:txt).should equal(mock_txt)
      end

      it "should re-render the 'edit' template" do
        Txt.stub!(:find).and_return(mock_txt(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested txt" do
      Txt.should_receive(:find).with("37").and_return(mock_txt)
      mock_txt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the txts list" do
      Txt.stub!(:find).and_return(mock_txt(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(txts_url)
    end

  end

end
