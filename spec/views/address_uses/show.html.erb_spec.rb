require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/show.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    assigns[:address_use] = @address_use = stub_model(AddressUse,
      :target_type => AddressUse.targets(:capitalized).first
    )
  end

  it "should render attributes in <p>" do
    render "/address_uses/show.html.erb"
    response.should have_text(/value\ for\ target_type/)
  end
end

