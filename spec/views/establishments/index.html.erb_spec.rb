require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/establishments/index.html.erb" do
  include EstablishmentsHelper
  
  before(:each) do
    assigns[:establishments] = [
      stub_model(Establishment,
        :name => "value for name"
      ),
      stub_model(Establishment,
        :name => "value for name"
      )
    ]
  end

  it "should render list of establishments" do
    render "/establishments/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

