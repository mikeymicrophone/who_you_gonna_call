require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RendezvouzsController do

  def mock_rendezvouz(stubs={})
    @mock_rendezvouz ||= mock_model(Rendezvouz, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all rendezvouzs as @rendezvouzs" do
      Rendezvouz.should_receive(:find).with(:all).and_return([mock_rendezvouz])
      get :index
      assigns[:rendezvouzs].should == [mock_rendezvouz]
    end

    describe "with mime type of xml" do
  
      it "should render all rendezvouzs as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Rendezvouz.should_receive(:find).with(:all).and_return(rendezvouzs = mock("Array of Rendezvouzs"))
        rendezvouzs.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested rendezvouz as @rendezvouz" do
      Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
      get :show, :id => "37"
      assigns[:rendezvouz].should equal(mock_rendezvouz)
    end
    
    describe "with mime type of xml" do

      it "should render the requested rendezvouz as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
        mock_rendezvouz.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new rendezvouz as @rendezvouz" do
      Rendezvouz.should_receive(:new).and_return(mock_rendezvouz)
      get :new
      assigns[:rendezvouz].should equal(mock_rendezvouz)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested rendezvouz as @rendezvouz" do
      Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
      get :edit, :id => "37"
      assigns[:rendezvouz].should equal(mock_rendezvouz)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created rendezvouz as @rendezvouz" do
        Rendezvouz.should_receive(:new).with({'these' => 'params'}).and_return(mock_rendezvouz(:save => true))
        post :create, :rendezvouz => {:these => 'params'}
        assigns(:rendezvouz).should equal(mock_rendezvouz)
      end

      it "should redirect to the created rendezvouz" do
        Rendezvouz.stub!(:new).and_return(mock_rendezvouz(:save => true))
        post :create, :rendezvouz => {}
        response.should redirect_to(rendezvouz_url(mock_rendezvouz))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved rendezvouz as @rendezvouz" do
        Rendezvouz.stub!(:new).with({'these' => 'params'}).and_return(mock_rendezvouz(:save => false))
        post :create, :rendezvouz => {:these => 'params'}
        assigns(:rendezvouz).should equal(mock_rendezvouz)
      end

      it "should re-render the 'new' template" do
        Rendezvouz.stub!(:new).and_return(mock_rendezvouz(:save => false))
        post :create, :rendezvouz => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested rendezvouz" do
        Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
        mock_rendezvouz.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rendezvouz => {:these => 'params'}
      end

      it "should expose the requested rendezvouz as @rendezvouz" do
        Rendezvouz.stub!(:find).and_return(mock_rendezvouz(:update_attributes => true))
        put :update, :id => "1"
        assigns(:rendezvouz).should equal(mock_rendezvouz)
      end

      it "should redirect to the rendezvouz" do
        Rendezvouz.stub!(:find).and_return(mock_rendezvouz(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(rendezvouz_url(mock_rendezvouz))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested rendezvouz" do
        Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
        mock_rendezvouz.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rendezvouz => {:these => 'params'}
      end

      it "should expose the rendezvouz as @rendezvouz" do
        Rendezvouz.stub!(:find).and_return(mock_rendezvouz(:update_attributes => false))
        put :update, :id => "1"
        assigns(:rendezvouz).should equal(mock_rendezvouz)
      end

      it "should re-render the 'edit' template" do
        Rendezvouz.stub!(:find).and_return(mock_rendezvouz(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested rendezvouz" do
      Rendezvouz.should_receive(:find).with("37").and_return(mock_rendezvouz)
      mock_rendezvouz.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the rendezvouzs list" do
      Rendezvouz.stub!(:find).and_return(mock_rendezvouz(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(rendezvouzs_url)
    end

  end

end
