require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/new.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    assigns[:phone_use] = stub_model(PhoneUse,
      :new_record? => true,
      :target_type => "value for target_type"
    )
  end

  it "should render new form" do
    render "/phone_uses/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", phone_uses_path) do
      with_tag("input#phone_use_target_type[name=?]", "phone_use[target_type]")
    end
  end
end


