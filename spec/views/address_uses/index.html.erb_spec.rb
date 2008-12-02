require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/index.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    assigns[:address_uses] = [
      stub_model(AddressUse,
        :target_type => AddressUse.targets(:capitalized).first
      ),
      stub_model(AddressUse,
        :target_type => AddressUse.targets(:capitalized).first
      )
    ]
  end

  it "should render list of address_uses" do
    render "/address_uses/index.html.erb"
    response.should have_tag("tr>td", AddressUse.targets(:capitalized).first, 2)
  end
end

