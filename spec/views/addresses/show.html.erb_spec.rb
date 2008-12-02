require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/show.html.erb" do
  include AddressesHelper
  
  before(:each) do
    assigns[:address] = @address = stub_model(Address,
      :street_number => "value for street_number",
      :line2 => "value for line2"
    )
  end

  it "should render attributes in <p>" do
    render "/addresses/show.html.erb"
    response.should have_text(/value\ for\ street_number/)
    response.should have_text(/value\ for\ line2/)
  end
end

