require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PartiesController do

  def mock_party(stubs={})
    @mock_party ||= mock_model(Party, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all parties as @parties" do
      Party.should_receive(:find).with(:all).and_return([mock_party])
      get :index
      assigns[:parties].should == [mock_party]
    end

    describe "with mime type of xml" do
  
      it "should render all parties as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Party.should_receive(:find).with(:all).and_return(parties = mock("Array of Parties"))
        parties.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested party as @party" do
      Party.should_receive(:find).with("37").and_return(mock_party)
      get :show, :id => "37"
      assigns[:party].should equal(mock_party)
    end
    
    describe "with mime type of xml" do

      it "should render the requested party as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Party.should_receive(:find).with("37").and_return(mock_party)
        mock_party.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new party as @party" do
      Party.should_receive(:new).and_return(mock_party)
      get :new
      assigns[:party].should equal(mock_party)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested party as @party" do
      Party.should_receive(:find).with("37").and_return(mock_party)
      get :edit, :id => "37"
      assigns[:party].should equal(mock_party)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created party as @party" do
        Party.should_receive(:new).with({'these' => 'params'}).and_return(mock_party(:save => true))
        post :create, :party => {:these => 'params'}
        assigns(:party).should equal(mock_party)
      end

      it "should redirect to the created party" do
        Party.stub!(:new).and_return(mock_party(:save => true))
        post :create, :party => {}
        response.should redirect_to(party_url(mock_party))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved party as @party" do
        Party.stub!(:new).with({'these' => 'params'}).and_return(mock_party(:save => false))
        post :create, :party => {:these => 'params'}
        assigns(:party).should equal(mock_party)
      end

      it "should re-render the 'new' template" do
        Party.stub!(:new).and_return(mock_party(:save => false))
        post :create, :party => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested party" do
        Party.should_receive(:find).with("37").and_return(mock_party)
        mock_party.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :party => {:these => 'params'}
      end

      it "should expose the requested party as @party" do
        Party.stub!(:find).and_return(mock_party(:update_attributes => true))
        put :update, :id => "1"
        assigns(:party).should equal(mock_party)
      end

      it "should redirect to the party" do
        Party.stub!(:find).and_return(mock_party(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(party_url(mock_party))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested party" do
        Party.should_receive(:find).with("37").and_return(mock_party)
        mock_party.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :party => {:these => 'params'}
      end

      it "should expose the party as @party" do
        Party.stub!(:find).and_return(mock_party(:update_attributes => false))
        put :update, :id => "1"
        assigns(:party).should equal(mock_party)
      end

      it "should re-render the 'edit' template" do
        Party.stub!(:find).and_return(mock_party(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested party" do
      Party.should_receive(:find).with("37").and_return(mock_party)
      mock_party.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the parties list" do
      Party.stub!(:find).and_return(mock_party(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(parties_url)
    end

  end

end
