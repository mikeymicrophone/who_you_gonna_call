require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/establishments/show.html.erb" do
  include EstablishmentsHelper
  
  before(:each) do
    assigns[:establishment] = @establishment = stub_model(Establishment,
      :name => "value for name",
    )
  end

  it "should render attributes in <p>" do
    render "/establishments/show.html.erb"
    response.should have_text(/value\ for\ name/)
  end
end

