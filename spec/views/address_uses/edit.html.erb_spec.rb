require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/address_uses/edit.html.erb" do
  include AddressUsesHelper
  
  before(:each) do
    assigns[:address_use] = @address_use = stub_model(AddressUse,
      :new_record? => false,
      :target_type => "value for target_type",
    )
  end

  it "should render edit form" do
    render "/address_uses/edit.html.erb"
    
    response.should have_tag("form[action=#{address_use_path(@address_use)}][method=post]") do
      with_tag('input#address_use_target_type[name=?]', "address_use[target_type]")
    end
  end
end


