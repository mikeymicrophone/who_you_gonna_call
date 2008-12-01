require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UnitsController do

  def mock_unit(stubs={})
    @mock_unit ||= mock_model(Unit, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all units as @units" do
      Unit.should_receive(:find).with(:all).and_return([mock_unit])
      get :index
      assigns[:units].should == [mock_unit]
    end

    describe "with mime type of xml" do
  
      it "should render all units as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Unit.should_receive(:find).with(:all).and_return(units = mock("Array of Units"))
        units.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested unit as @unit" do
      Unit.should_receive(:find).with("37").and_return(mock_unit)
      get :show, :id => "37"
      assigns[:unit].should equal(mock_unit)
    end
    
    describe "with mime type of xml" do

      it "should render the requested unit as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Unit.should_receive(:find).with("37").and_return(mock_unit)
        mock_unit.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new unit as @unit" do
      Unit.should_receive(:new).and_return(mock_unit)
      get :new
      assigns[:unit].should equal(mock_unit)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested unit as @unit" do
      Unit.should_receive(:find).with("37").and_return(mock_unit)
      get :edit, :id => "37"
      assigns[:unit].should equal(mock_unit)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created unit as @unit" do
        Unit.should_receive(:new).with({'these' => 'params'}).and_return(mock_unit(:save => true))
        post :create, :unit => {:these => 'params'}
        assigns(:unit).should equal(mock_unit)
      end

      it "should redirect to the created unit" do
        Unit.stub!(:new).and_return(mock_unit(:save => true))
        post :create, :unit => {}
        response.should redirect_to(unit_url(mock_unit))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved unit as @unit" do
        Unit.stub!(:new).with({'these' => 'params'}).and_return(mock_unit(:save => false))
        post :create, :unit => {:these => 'params'}
        assigns(:unit).should equal(mock_unit)
      end

      it "should re-render the 'new' template" do
        Unit.stub!(:new).and_return(mock_unit(:save => false))
        post :create, :unit => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested unit" do
        Unit.should_receive(:find).with("37").and_return(mock_unit)
        mock_unit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :unit => {:these => 'params'}
      end

      it "should expose the requested unit as @unit" do
        Unit.stub!(:find).and_return(mock_unit(:update_attributes => true))
        put :update, :id => "1"
        assigns(:unit).should equal(mock_unit)
      end

      it "should redirect to the unit" do
        Unit.stub!(:find).and_return(mock_unit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(unit_url(mock_unit))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested unit" do
        Unit.should_receive(:find).with("37").and_return(mock_unit)
        mock_unit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :unit => {:these => 'params'}
      end

      it "should expose the unit as @unit" do
        Unit.stub!(:find).and_return(mock_unit(:update_attributes => false))
        put :update, :id => "1"
        assigns(:unit).should equal(mock_unit)
      end

      it "should re-render the 'edit' template" do
        Unit.stub!(:find).and_return(mock_unit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested unit" do
      Unit.should_receive(:find).with("37").and_return(mock_unit)
      mock_unit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the units list" do
      Unit.stub!(:find).and_return(mock_unit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(units_url)
    end

  end

end
