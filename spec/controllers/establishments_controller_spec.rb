require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EstablishmentsController do

  def mock_establishment(stubs={})
    @mock_establishment ||= mock_model(Establishment, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all establishments as @establishments" do
      Establishment.should_receive(:find).with(:all).and_return([mock_establishment])
      get :index
      assigns[:establishments].should == [mock_establishment]
    end

    describe "with mime type of xml" do
  
      it "should render all establishments as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Establishment.should_receive(:find).with(:all).and_return(establishments = mock("Array of Establishments"))
        establishments.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested establishment as @establishment" do
      Establishment.should_receive(:find).with("37").and_return(mock_establishment)
      get :show, :id => "37"
      assigns[:establishment].should equal(mock_establishment)
    end
    
    describe "with mime type of xml" do

      it "should render the requested establishment as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Establishment.should_receive(:find).with("37").and_return(mock_establishment)
        mock_establishment.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new establishment as @establishment" do
      Establishment.should_receive(:new).and_return(mock_establishment)
      get :new
      assigns[:establishment].should equal(mock_establishment)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested establishment as @establishment" do
      Establishment.should_receive(:find).with("37").and_return(mock_establishment)
      get :edit, :id => "37"
      assigns[:establishment].should equal(mock_establishment)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created establishment as @establishment" do
        Establishment.should_receive(:new).with({'these' => 'params'}).and_return(mock_establishment(:save => true))
        post :create, :establishment => {:these => 'params'}
        assigns(:establishment).should equal(mock_establishment)
      end

      it "should redirect to the created establishment" do
        Establishment.stub!(:new).and_return(mock_establishment(:save => true))
        post :create, :establishment => {}
        response.should redirect_to(establishment_url(mock_establishment))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved establishment as @establishment" do
        Establishment.stub!(:new).with({'these' => 'params'}).and_return(mock_establishment(:save => false))
        post :create, :establishment => {:these => 'params'}
        assigns(:establishment).should equal(mock_establishment)
      end

      it "should re-render the 'new' template" do
        Establishment.stub!(:new).and_return(mock_establishment(:save => false))
        post :create, :establishment => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested establishment" do
        Establishment.should_receive(:find).with("37").and_return(mock_establishment)
        mock_establishment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :establishment => {:these => 'params'}
      end

      it "should expose the requested establishment as @establishment" do
        Establishment.stub!(:find).and_return(mock_establishment(:update_attributes => true))
        put :update, :id => "1"
        assigns(:establishment).should equal(mock_establishment)
      end

      it "should redirect to the establishment" do
        Establishment.stub!(:find).and_return(mock_establishment(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(establishment_url(mock_establishment))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested establishment" do
        Establishment.should_receive(:find).with("37").and_return(mock_establishment)
        mock_establishment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :establishment => {:these => 'params'}
      end

      it "should expose the establishment as @establishment" do
        Establishment.stub!(:find).and_return(mock_establishment(:update_attributes => false))
        put :update, :id => "1"
        assigns(:establishment).should equal(mock_establishment)
      end

      it "should re-render the 'edit' template" do
        Establishment.stub!(:find).and_return(mock_establishment(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested establishment" do
      Establishment.should_receive(:find).with("37").and_return(mock_establishment)
      mock_establishment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the establishments list" do
      Establishment.stub!(:find).and_return(mock_establishment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(establishments_url)
    end

  end

end
