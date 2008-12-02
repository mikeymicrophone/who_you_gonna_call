require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/addresses/new.html.erb" do
  include AddressesHelper
  
  before(:each) do
    assigns[:address] = stub_model(Address,
      :new_record? => true,
      :street_number => "value for street_number",
      :line2 => "value for line2"
    )
  end

  it "should render new form" do
    render "/addresses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", addresses_path) do
      with_tag("input#address_street_number[name=?]", "address[street_number]")
      with_tag("input#address_line2[name=?]", "address[line2]")
    end
  end
end


