require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/services/index.html.erb" do
  include ServicesHelper
  
  before(:each) do
    assigns[:services] = [
      stub_model(Service,
        :name => "value for name",
      ),
      stub_model(Service,
        :name => "value for name",
      )
    ]
  end

  it "should render list of services" do
    render "/services/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

