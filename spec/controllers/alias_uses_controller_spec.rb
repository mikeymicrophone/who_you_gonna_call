require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AliasUsesController do

  def mock_alias_use(stubs={})
    @mock_alias_use ||= mock_model(AliasUse, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all alias_uses as @alias_uses" do
      AliasUse.should_receive(:find).with(:all).and_return([mock_alias_use])
      get :index
      assigns[:alias_uses].should == [mock_alias_use]
    end

    describe "with mime type of xml" do
  
      it "should render all alias_uses as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        AliasUse.should_receive(:find).with(:all).and_return(alias_uses = mock("Array of AliasUses"))
        alias_uses.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested alias_use as @alias_use" do
      AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
      get :show, :id => "37"
      assigns[:alias_use].should equal(mock_alias_use)
    end
    
    describe "with mime type of xml" do

      it "should render the requested alias_use as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
        mock_alias_use.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new alias_use as @alias_use" do
      AliasUse.should_receive(:new).and_return(mock_alias_use)
      get :new
      assigns[:alias_use].should equal(mock_alias_use)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested alias_use as @alias_use" do
      AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
      get :edit, :id => "37"
      assigns[:alias_use].should equal(mock_alias_use)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created alias_use as @alias_use" do
        AliasUse.should_receive(:new).with({'these' => 'params'}).and_return(mock_alias_use(:save => true))
        post :create, :alias_use => {:these => 'params'}
        assigns(:alias_use).should equal(mock_alias_use)
      end

      it "should redirect to the created alias_use" do
        AliasUse.stub!(:new).and_return(mock_alias_use(:save => true))
        post :create, :alias_use => {}
        response.should redirect_to(alias_use_url(mock_alias_use))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved alias_use as @alias_use" do
        AliasUse.stub!(:new).with({'these' => 'params'}).and_return(mock_alias_use(:save => false))
        post :create, :alias_use => {:these => 'params'}
        assigns(:alias_use).should equal(mock_alias_use)
      end

      it "should re-render the 'new' template" do
        AliasUse.stub!(:new).and_return(mock_alias_use(:save => false))
        post :create, :alias_use => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested alias_use" do
        AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
        mock_alias_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :alias_use => {:these => 'params'}
      end

      it "should expose the requested alias_use as @alias_use" do
        AliasUse.stub!(:find).and_return(mock_alias_use(:update_attributes => true))
        put :update, :id => "1"
        assigns(:alias_use).should equal(mock_alias_use)
      end

      it "should redirect to the alias_use" do
        AliasUse.stub!(:find).and_return(mock_alias_use(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(alias_use_url(mock_alias_use))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested alias_use" do
        AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
        mock_alias_use.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :alias_use => {:these => 'params'}
      end

      it "should expose the alias_use as @alias_use" do
        AliasUse.stub!(:find).and_return(mock_alias_use(:update_attributes => false))
        put :update, :id => "1"
        assigns(:alias_use).should equal(mock_alias_use)
      end

      it "should re-render the 'edit' template" do
        AliasUse.stub!(:find).and_return(mock_alias_use(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested alias_use" do
      AliasUse.should_receive(:find).with("37").and_return(mock_alias_use)
      mock_alias_use.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the alias_uses list" do
      AliasUse.stub!(:find).and_return(mock_alias_use(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(alias_uses_url)
    end

  end

end
