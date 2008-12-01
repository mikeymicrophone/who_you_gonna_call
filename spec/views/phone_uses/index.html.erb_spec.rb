require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/index.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    assigns[:phone_uses] = [
      stub_model(PhoneUse,
        :target_type => "value for target_type",
      ),
      stub_model(PhoneUse,
        :target_type => "value for target_type",
      )
    ]
  end

  it "should render list of phone_uses" do
    render "/phone_uses/index.html.erb"
    response.should have_tag("tr>td", "value for target_type", 2)
  end
end

