require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/phone_uses/index.html.erb" do
  include PhoneUsesHelper
  
  before(:each) do
    assigns[:phone_uses] = [
      stub_model(PhoneUse,
        :target_type => PhoneUse.targets(:capitalized).first
      ),
      stub_model(PhoneUse,
        :target_type => PhoneUse.targets(:capitalized).first
      )
    ]
  end

  it "should render list of phone_uses" do
    render "/phone_uses/index.html.erb"
    response.should have_tag("tr>td", PhoneUse.targets(:capitalized).first, 2)
  end
end

