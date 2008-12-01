require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/streets/index.html.erb" do
  include StreetsHelper
  
  before(:each) do
    assigns[:streets] = [
      stub_model(Street,
        :name => "value for name",
      ),
      stub_model(Street,
        :name => "value for name",
      )
    ]
  end

  it "should render list of streets" do
    render "/streets/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

