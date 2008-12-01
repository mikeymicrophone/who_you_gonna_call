require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/zips/index.html.erb" do
  include ZipsHelper
  
  before(:each) do
    assigns[:zips] = [
      stub_model(Zip,
        :name => "value for name",
      ),
      stub_model(Zip,
        :name => "value for name",
      )
    ]
  end

  it "should render list of zips" do
    render "/zips/index.html.erb"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

