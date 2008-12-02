require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/new.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    assigns[:address_use] = stub_model(AddressUse,
      :new_record? => true,
      :target_type => AddressUse.targets(:capitalized).first
    )
  end

  it "should render new form" do
    render "/address_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", address_uses_path) do
      with_tag("input#address_use_target_type[name=?]", "address_use[target_type]")
    end
  end
end


