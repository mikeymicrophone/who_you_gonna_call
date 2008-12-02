require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cities/index.html.erb" do
  include CitiesHelper
  
  before(:each) do
    assigns[:cities] = [
      stub_model(City,
        :name => "value for name"
      ),
      stub_model(City,
        :name => "value for name"
      )
    ]
  end

  it "should render list of cities" do
    render "/cities/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

