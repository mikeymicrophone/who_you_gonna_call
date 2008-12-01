require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/index.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    assigns[:address_uses] = [
      stub_model(AddressUse,
        :target_type => "value for target_type",
      ),
      stub_model(AddressUse,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of address_uses" do
    render "/address_uses/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

