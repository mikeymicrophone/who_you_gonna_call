require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AliasesController do

  def mock_alias(stubs={})
    @mock_alias ||= mock_model(Alias, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all aliases as @aliases" do
      Alias.should_receive(:find).with(:all).and_return([mock_alias])
      get :index
      assigns[:aliases].should == [mock_alias]
    end

    describe "with mime type of xml" do
  
      it "should render all aliases as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Alias.should_receive(:find).with(:all).and_return(aliases = mock("Array of Aliases"))
        aliases.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested alias as @alias" do
      Alias.should_receive(:find).with("37").and_return(mock_alias)
      get :show, :id => "37"
      assigns[:alias].should equal(mock_alias)
    end
    
    describe "with mime type of xml" do

      it "should render the requested alias as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Alias.should_receive(:find).with("37").and_return(mock_alias)
        mock_alias.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new alias as @alias" do
      Alias.should_receive(:new).and_return(mock_alias)
      get :new
      assigns[:alias].should equal(mock_alias)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested alias as @alias" do
      Alias.should_receive(:find).with("37").and_return(mock_alias)
      get :edit, :id => "37"
      assigns[:alias].should equal(mock_alias)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created alias as @alias" do
        Alias.should_receive(:new).with({'these' => 'params'}).and_return(mock_alias(:save => true))
        post :create, :alias => {:these => 'params'}
        assigns(:alias).should equal(mock_alias)
      end

      it "should redirect to the created alias" do
        Alias.stub!(:new).and_return(mock_alias(:save => true))
        post :create, :alias => {}
        response.should redirect_to(alias_url(mock_alias))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved alias as @alias" do
        Alias.stub!(:new).with({'these' => 'params'}).and_return(mock_alias(:save => false))
        post :create, :alias => {:these => 'params'}
        assigns(:alias).should equal(mock_alias)
      end

      it "should re-render the 'new' template" do
        Alias.stub!(:new).and_return(mock_alias(:save => false))
        post :create, :alias => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested alias" do
        Alias.should_receive(:find).with("37").and_return(mock_alias)
        mock_alias.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :alias => {:these => 'params'}
      end

      it "should expose the requested alias as @alias" do
        Alias.stub!(:find).and_return(mock_alias(:update_attributes => true))
        put :update, :id => "1"
        assigns(:alias).should equal(mock_alias)
      end

      it "should redirect to the alias" do
        Alias.stub!(:find).and_return(mock_alias(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(alias_url(mock_alias))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested alias" do
        Alias.should_receive(:find).with("37").and_return(mock_alias)
        mock_alias.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :alias => {:these => 'params'}
      end

      it "should expose the alias as @alias" do
        Alias.stub!(:find).and_return(mock_alias(:update_attributes => false))
        put :update, :id => "1"
        assigns(:alias).should equal(mock_alias)
      end

      it "should re-render the 'edit' template" do
        Alias.stub!(:find).and_return(mock_alias(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested alias" do
      Alias.should_receive(:find).with("37").and_return(mock_alias)
      mock_alias.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the aliases list" do
      Alias.stub!(:find).and_return(mock_alias(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(aliases_url)
    end

  end

end
