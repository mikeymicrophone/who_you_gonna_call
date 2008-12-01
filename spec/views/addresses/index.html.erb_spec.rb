require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/index.html.erb" do
  include AddressesHelper
  
  before(:each) do
    assigns[:addresses] = [
      stub_model(Address,
        :street_number => "value for street_number",
        :line2 => "value for line2",
      ),
      stub_model(Address,
        :street_number => "value for street_number",
        :line2 => "value for line2",
      )
    ]
  end

  it "should render list of addresses" do
    render "/addresses/index.html.erb"
    response.should have_tag("tr>td", "value for street_number", 2)
    response.should have_tag("tr>td", "value for line2", 2)
  end
end

